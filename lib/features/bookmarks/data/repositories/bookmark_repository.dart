import 'package:isar/isar.dart';

import '../models/bookmark_model.dart';

class BookmarkRepository {

  final Isar isar;

  BookmarkRepository(
    this.isar,
  );


  Future<void> save({

    required String title,
    required double price,
  }) async {

    final bookmark =
        BookmarkModel()

          ..title = title
          ..price = price;


    await isar.writeTxn(
      () async {

        await isar.bookmarkModels.put(
          bookmark,
        );
      },
    );
  }
}