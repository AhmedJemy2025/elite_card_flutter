// ignore_for_file: depend_on_referenced_packages

// import 'package:authentication/domain/entities/user_response.dart';
import 'package:get_storage/get_storage.dart';

import '../storage/db_helper.dart';
import 'caching_keys.dart';

class PreferenceManager {
  void saveFCMToken(String fcmToken) => GetStorage().write(CachingKey.FCM_TOKEN, fcmToken);

  String fcmToken() => GetStorage().read(CachingKey.FCM_TOKEN) as String ?? "";

  void saveIsDarkMode(bool isDark) => GetStorage().write(CachingKey.IS_DARK_MODE, isDark);

  bool isDarkMode() => GetStorage().read(CachingKey.IS_DARK_MODE) as bool? ?? false;

  void saveVoip(String voipToken) => GetStorage().write(CachingKey.VOIP_TOKEN, voipToken);

  String voipToken() => GetStorage().read(CachingKey.VOIP_TOKEN) as String;

  void saveIsFirstTime(bool isFirstTime) => GetStorage().write(CachingKey.IS_FIRST_TIME, isFirstTime);

  bool isFirstTime() => GetStorage().read(CachingKey.IS_FIRST_TIME) as bool? ?? true;

  void saveIsLoggedIn(bool isLoggedIn) => GetStorage().write(CachingKey.IS_LOGGED_IN, isLoggedIn);

  bool isLoggedIn() => GetStorage().read(CachingKey.IS_LOGGED_IN) as bool? ?? false;

  void saveAuthToken(String authToken) => GetStorage().write(CachingKey.AUTH_TOKEN, authToken != '' ? "Bearer $authToken" : '');

  String authToken() => GetStorage().read(CachingKey.AUTH_TOKEN) as String? ?? "";

//   void saveUser(UserModel userData) => GetStorage().write(CachingKey.USER, userData.toJson());
//   UserModel? currentUser() => UserModel.fromJson(GetStorage().read(CachingKey.USER));

  void saveValue(String cachingKey, String value) => GetStorage().write(cachingKey, value);

  String getValue(String cachingKey) => GetStorage().read(cachingKey) as String;

  void saveLanguage(String lang) => GetStorage().write(CachingKey.LANGUAGE, lang);

  String currentLang() => GetStorage().read(CachingKey.LANGUAGE) as String? ?? "ar";

  // void saveUserModel(UserResponse userModel) => GetStorage().write(CachingKey.USER_MODEL, userModel.toJson());
  //
  //  userModel() => UserResponse().fromJson(GetStorage().read(CachingKey.USER_MODEL)) ;
  //
  // bool isMe(String id) {
  //   UserResponse user = userModel();
  //   return user.id == id;
  // }

  void logout() {
    // GetStorage().erase();
    GetStorage().remove(CachingKey.USER_MODEL);
    GetStorage().remove(CachingKey.AUTH_TOKEN);
    DatabaseHelper.internal().clear();
    saveIsLoggedIn(false);
  }
}
