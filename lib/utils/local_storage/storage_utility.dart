import 'package:get_storage/get_storage.dart';

class CLocalStorage {
  static final CLocalStorage _instance = CLocalStorage._internal();

  factory CLocalStorage() {
    return _instance;
  }

  CLocalStorage._internal();

  final _storage = GetStorage();

  //generic method to save data
  Future<void> saveData<C>(String key, C value) async {
    await _storage.write(key, value);
  }

  //generic method to read data
  C? readData<C>(String key) {
    return _storage.read<C>(key);
  }

  //generic method to delete data
  Future<void> deleteData(String key) async {
    await _storage.remove(key);
  }

  //generic method to clear all data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
