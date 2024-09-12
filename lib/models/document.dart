import 'package:isar/isar.dart';
part 'document.g.dart';

@collection
class Document {
  Id? isarId;
  late String fileSize;
  late String fileRoute;
  @Index(unique: true)
  late String fileName;
  late List<int> pdfBytes;
  late DateTime createdAt;

  Document({
    required this.fileName,
    required this.pdfBytes,
  });
}
