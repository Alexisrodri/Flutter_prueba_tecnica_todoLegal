import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/models/document.dart';

final selectedDocumentProvider = StateProvider<Document?>((ref) => null);

final selectedCertificateDocumentProvider =
    StateProvider<Document?>((ref) => null);

final passwordProvider = StateProvider<String>((ref) => '');
