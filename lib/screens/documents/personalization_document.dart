import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/helper/pdf_signature_position.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';
import '../provider/providers.dart';

class PersonalizationDocument extends ConsumerWidget {
  final TabController tabController;

  const PersonalizationDocument({super.key, required this.tabController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDocument = ref.watch(selectedDocumentProvider);
    final selectedCertificate = ref.watch(selectedCertificateDocumentProvider);
    final password = ref.watch(passwordProvider);

    if (selectedDocument == null) {
      return const Center(
        child: Text('No hay un documento seleccionado.'),
      );
    }

    final Uint8List pdfBytes = Uint8List.fromList(selectedDocument.pdfBytes);
    final Uint8List certificateBytes =
        Uint8List.fromList(selectedCertificate!.pdfBytes);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Labels(
              text: 'Posicionar las firmas',
              secondText:
                  'Seleccione el firmante y pincha en donde deseas que se estampen las firmas e iniciales',
              secondSize: 12,
              alignment: CrossAxisAlignment.center,
            ),
          ),
          CustomSelect(
            name: 'Paúl Quiñonez',
            onLeftArrowPressed: () {},
            onRightArrowPressed: () {},
          ),
          CustomPdfViewer(
            pdfbytes: pdfBytes,
            password: password,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: const Flex(direction: Axis.vertical, children: [
              Text(
                'Importante:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'El certificado de Firma Electrónica, solo se podrá posicionar una vez en el documento. Toma en cuenta que el certificado firma todo el documento y no sólo una hoja en particular.',
                style: TextStyle(fontSize: 12),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'Finalizar',
              onPress: () {
                tabController.animateTo(tabController.index + 1);
                addSignatureToPdf(pdfBytes, certificateBytes);
              },
            ),
          ),
        ],
      ),
    );
  }
}
