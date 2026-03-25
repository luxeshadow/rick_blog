import 'dart:io';

class AppImages {
  AppImages._();

  static const Map<String, String> _androidIcons = {
    'app_logo': 'assets/images/logo_images/android/app_logo.png',
    'app_logo_1': 'assets/images/logo_images/android/app_logo_1.png',
    'user': 'assets/images/app_icons/android/user.png',
    'email': 'assets/images/app_icons/android/email.png',
    'google': 'assets/images/app_icons/android/google.png',
    'apple': 'assets/images/app_icons/android/apple.png',
    'password': 'assets/images/app_icons/android/password.png',
    'show_password': 'assets/images/app_icons/android/show_password.png',
    'hide_password': 'assets/images/app_icons/android/hide_password.png',
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
