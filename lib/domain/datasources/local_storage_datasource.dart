import 'package:prueba_tecnica_tl/models/document.dart';

abstract class LocalStorageDatasource {
  Future<void> toogleDocument(Document doc);

  Future<bool> hasDocumentInDb();

  Future<List<Document>> loadDocuments({int limit = 10, offset = 0});
}
