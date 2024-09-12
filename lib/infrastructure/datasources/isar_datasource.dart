import 'package:isar/isar.dart';
import 'package:prueba_tecnica_tl/domain/domain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prueba_tecnica_tl/models/document.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([DocumentSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> hasDocumentInDb() async {
    final isar = await db;
    final existingDocument = await isar.documents.where().count() > 0;
    // print('existingDocument::$existingDocument');
    if (!existingDocument) {
      return false;
    }
    return true;
  }

  @override
  Future<List<Document>> loadDocuments({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.documents.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toogleDocument(Document doc) async {
    final isar = await db;
    final documentinDb = await isar.documents
        .filter()
        .isarIdEqualTo(doc.isarId ?? 0)
        .findFirst();
    if (documentinDb != null) {
      isar.writeTxnSync(() => isar.documents.deleteSync(doc.isarId!));
      return;
    }
    isar.writeTxnSync(() => isar.documents.putSync(doc));
  }
}
