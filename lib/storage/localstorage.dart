import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static const String isLoggedInKey = 'isLoggedIn';

  static Future<void> saveLoginState(bool isLoggedIn) async {
    await GetStorage().write(isLoggedInKey, isLoggedIn);
  }

  static Future<bool> getLoginState() async {
    return GetStorage().read<bool>(isLoggedInKey) ?? false;
  }
}
