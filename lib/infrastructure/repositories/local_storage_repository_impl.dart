import 'package:prueba_tecnica_tl/domain/domain.dart';
import 'package:prueba_tecnica_tl/models/document.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> hasDocumentInDb() {
    return datasource.hasDocumentInDb();
  }

  @override
  Future<List<Document>> loadDocuments({int limit = 10, offset = 0}) {
    return datasource.loadDocuments(limit: limit, offset: offset);
  }

  @override
  Future<void> toogleDocument(Document doc) {
    return datasource.toogleDocument(doc);
  }
}
