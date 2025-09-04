import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final GetStorage _box = GetStorage();

  /// -- Save Data
  static void saveData(String key, dynamic value) {
    _box.write(key, value);
  }

  /// -- Read Data
  static dynamic readData(String key) {
    return _box.read(key);
  }

  /// -- Delete Data
  static void deleteData(String key) {
    _box.remove(key);
  }

  /// -- Clear All Data
  static void clearAll() {
    _box.erase();
  }

  /// -- Check if Key Exists
  static bool hasData(String key) {
    return _box.hasData(key);
  }
}
