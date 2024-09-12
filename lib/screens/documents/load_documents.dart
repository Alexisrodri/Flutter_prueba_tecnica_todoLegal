import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/helper/helpers.dart';
import 'package:prueba_tecnica_tl/screens/provider/providers.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

final hasDocumentInDb =
    FutureProvider.family.autoDispose((ref, String filename) {
  final localStorageRepository = ref.watch(documentInDb.notifier);
  return localStorageRepository.hasDocumentsInDb();
});

class LoadDocuments extends ConsumerWidget {
  final TabController tabController;

  const LoadDocuments({super.key, required this.tabController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasDocuments = ref.watch(hasDocumentInDb(''));
    return hasDocuments.when(
        loading: () => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
        error: (_, __) => throw Error(),
        data: (data) => data
            ? LocalDocuments(
                tabController: tabController,
              )
            : const FilePickerDocuments());
  }
}

class LocalDocuments extends ConsumerStatefulWidget {
  final TabController tabController;

  const LocalDocuments({super.key, required this.tabController});

  @override
  LocalDocumentsState createState() => LocalDocumentsState();
}

class LocalDocumentsState extends ConsumerState<LocalDocuments> {
  @override
  void initState() {
    super.initState();
    ref.read(documentInDb.notifier).loadDocumentsDb();
  }

  @override
  Widget build(BuildContext context) {
    final docsInDB = ref.watch(documentInDb).values.toList();
    return ListView.builder(
      itemCount: docsInDB.length,
      itemBuilder: (context, index) {
        return Container(
          width: 500,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sube tus documentos y ordénalos'),
                  SizedBox(width: 5),
                  Icon(
                    Icons.help,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 500,
                child: CustomReordenableList(
                  items: docsInDB,
                  icon: Icons.abc_outlined,
                ),
              ),
              CustomButton(
                text: 'Cancelar',
                onPress: () {
                  context.go('/home');
                },
                isOutlined: true,
              ),
              CustomButton(
                text: 'Continuar',
                onPress: () {
                  widget.tabController
                      .animateTo(widget.tabController.index + 1);
                },
                isDisabled: docsInDB.isEmpty,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Prueba tecnica - Alex Avila',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FilePickerDocuments extends ConsumerWidget {
  const FilePickerDocuments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sube tus documentos y ordénalos'),
              SizedBox(width: 5),
              Icon(
                Icons.help,
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final document = await pickDocument(context, ['pdf']);
              // print('Document::$document');
              if (document != null) {
                await ref.read(documentInDb.notifier).toggleDocument(document);
                ref.invalidate(hasDocumentInDb(''));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: isDarkmode ? Colors.grey : const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1,
              child: const Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload_file_outlined, size: 80),
                  SizedBox(height: 10),
                  Text(
                    'Subir documento',
                  ),
                  SizedBox(height: 5),
                  Text(
                    'PDF 20MB',
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            text: 'Cancelar',
            onPress: () {
              context.go('/home');
            },
            isOutlined: true,
          ),
          CustomButton(
            text: 'Continuar',
            onPress: () {},
            isDisabled: true,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Prueba tecnica - Alex Avila',
              style: TextStyle(
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}
