import 'package:isar/isar.dart';

part 'bookmark_model.g.dart';

@collection
class BookmarkModel {

  Id id = Isar.autoIncrement;

  late String title;

  late double price;
}