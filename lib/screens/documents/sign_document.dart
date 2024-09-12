import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/helper/helpers.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';
import '../provider/providers.dart';

class BuildSignersTab extends ConsumerStatefulWidget {
  final TabController tabController;

  const BuildSignersTab({super.key, required this.tabController});

  @override
  BuildSignersTabState createState() => BuildSignersTabState();
}

class BuildSignersTabState extends ConsumerState<BuildSignersTab> {
  @override
  Widget build(BuildContext context) {
    final isButtonEnabled =
        ref.watch(selectedCertificateDocumentProvider) != null &&
            ref.watch(passwordProvider).length > 5;
    // final docsInDB = ref.watch(documentInDb).values.toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Tu Firma',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Firmante Registrado: Paúl Quiñonez',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'paul.quinonez@todolegal.com',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seleccionar certificado',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            CustomButton(
              text: 'Seleccionar',
              isOutlined: true,
              icon: Icons.keyboard_arrow_down,
              aligntext: TextAlign.start,
              onPress: () async {
                final document = await pickDocument(context, ['p12', 'img']);
                if (document != null) {
                  await ref
                      .read(documentInDb.notifier)
                      .toggleDocument(document);
                  ref.read(selectedCertificateDocumentProvider.notifier).state =
                      document;
                }
              },
            ),
            const SizedBox(height: 20),
            CustomInput(
              label: 'Contraseña',
              isPassword: true,
              onChanged: (String value) {
                ref.read(passwordProvider.notifier).state = value;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Cancelar',
              onPress: () {
                context.go('/home');
              },
              isOutlined: true,
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'Continuar',
              onPress: () {
                FocusScope.of(context).unfocus();
                widget.tabController.animateTo(widget.tabController.index + 1);
              },
              isDisabled: !isButtonEnabled,
            ),
            const SizedBox(height: 20),
            const Text(
              'Prueba tecnica - Alex Avila',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
