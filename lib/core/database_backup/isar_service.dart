import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';



class IsarService {

  static Future<Isar> open() async {

    final dir =
        await getApplicationDocumentsDirectory();

    return await Isar.open(

      [
        BookmarkModelSchema,
      ],

      directory: dir.path,
    );
  }
}