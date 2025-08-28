import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabi_cook/core/storage/hive_key_constants.dart';

class HiveClient {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveKeyConstants.favoriteBox);
  }
}
