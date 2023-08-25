import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveManager {
  static Box? myBox;

  static Future<Box> initializeHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  static Future<void> saveUserInfo(
      String uid, String email, String userName) async {
    await myBox?.put("id", uid);
    await myBox?.put("email", email);
    await myBox?.put("username", userName);
  }

  static Future<void> deleteAllBoxes() async {
    await myBox?.clear();
  }
}
