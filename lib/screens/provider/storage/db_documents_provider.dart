import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/domain/repositories/local_storage_repository.dart';
import 'package:prueba_tecnica_tl/models/document.dart';
import 'package:prueba_tecnica_tl/screens/provider/storage/local_storage_provider.dart';

final documentInDb =
    StateNotifierProvider<LocalStorageDocumentNotifier, Map<int, Document>>(
        (ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return LocalStorageDocumentNotifier(
      localStorageRepository: localStorageRepository);
});

class LocalStorageDocumentNotifier extends StateNotifier<Map<int, Document>> {
  final LocalStorageRepository localStorageRepository;

  LocalStorageDocumentNotifier({required this.localStorageRepository})
      : super({});

  Future<List<Document>> loadDocumentsDb() async {
    final documents = await localStorageRepository.loadDocuments();
    final tempDocs = <int, Document>{};
    for (final docs in documents) {
      tempDocs[docs.isarId!] = docs;
    }

    state = {...state, ...tempDocs};
    return documents;
  }

  Future<void> toggleDocument(Document document) async {
    await localStorageRepository.toogleDocument(document);
    final bool docInDb = state[document.isarId] != null;
    if (docInDb) {
      state.remove(document.isarId);
      state = {...state};
    } else {
      state = {...state, document.isarId!: document};
    }
  }

  Future<bool> hasDocumentsInDb() async {
    final documents = await localStorageRepository.loadDocuments();
    return documents.isNotEmpty;
  }
}
