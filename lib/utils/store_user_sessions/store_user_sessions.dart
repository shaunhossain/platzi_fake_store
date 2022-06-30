import 'package:shared_preferences/shared_preferences.dart';

class StoreUserSessions  {
  static final StoreUserSessions _singleton = StoreUserSessions._internal();
  StoreUserSessions._internal();

  factory StoreUserSessions() {
    return _singleton;
  }


  storeUserInfo({required String token, required int userId, required String userEmail}) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString("SECURE_TOKEN_KEY",token);
    await storage.setInt("User_ID", userId);
    await storage.setString("User_EMAIL", userEmail);
    await storage.reload();
  }

  storeUserToken({required String token}) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString("SECURE_TOKEN_KEY",token);
    await storage.reload();
  }

  Future<String?> getToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.reload();
    return storage.getString("SECURE_TOKEN_KEY");
  }

  Future<int?> getUserId() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.reload();
    return storage.getInt("User_ID");
  }

  Future<String?> getUserEmail() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.reload();
    return storage.getString("User_EMAIL");
  }


  Future<void> deleteAllInfo() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.reload();
    await storage.clear();
  }
}