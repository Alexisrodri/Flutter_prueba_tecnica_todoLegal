import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/infrastructure/infrastructure.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
});
