import 'dart:io';

class AppImages {
  AppImages._();

  static const Map<String, String> _androidIcons = {
    'email': 'assets/images/app_icons/android/email.png',
    'user': 'assets/images/app_icons/android/user.png',
  };

  static const Map<String, String> _iosIcons = {
    //iosIcons
  };


  static String get(String iconName) {
    if (Platform.isIOS) {
      return _iosIcons[iconName] ?? _androidIcons[iconName] ?? '';
    }
    return _androidIcons[iconName] ?? '';
  }
}
