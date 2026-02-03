import 'dart:io';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //----------------------------------------------------------------------------
  // Light Colors
  //----------------------------------------------------------------------------
  static const Map<String, Color> _androidLight = {
    'primary': Color(0xFF006FE6),
    'secondary': Color(0xFF006FE6),
    'tertiary': Color(0xFF006FE6),
    'background': Color(0xFFF2F2F0),
    'appBar': Colors.white,
    'container': Color(0xFFD9D8D7),
    'text': Color(0xFF030302),
    'subText': Color(0xFF4D4D4C),
    'icon': Color(0xFF030302),
    'success': Colors.green,
    'warning': Colors.orange,
    'error': Colors.red,
  };

  static const Map<String, Color> _iosLight = {
    // iOS spécifiques si besoin
  };

  //----------------------------------------------------------------------------
  // Dark Colors
  //----------------------------------------------------------------------------
  static const Map<String, Color> _androidDark = {
    'primary': Color(0xFF1A8AFF),
    'secondary': Color(0xFF1A8AFF),
    'tertiary': Color(0xFF1A8AFF),
    'background': Color(0xFF1C1C1A),
    'appBar': Color(0xFF2C2C2A),
    'container': Color(0xFF2D2D2B),
    'text': Color(0xFFF2F2F0),
    'subText': Color(0xFFB3B3B0),
    'icon': Color(0xFFF2F2F0),
    'success': Colors.green,
    'warning': Colors.orange,
    'error': Colors.red,
  };

  static const Map<String, Color> _iosDark = {
    // iOS spécifiques si besoin, sinon fallback Android
  };

  //----------------------------------------------------------------------------
  // Getter universel
  //----------------------------------------------------------------------------

  static Color get(String type, {Brightness brightness = Brightness.light}) {
    final isIOS = Platform.isIOS;

    if (brightness == Brightness.light) {
      return isIOS
          ? (_iosLight[type] ?? _androidLight[type] ?? Colors.transparent)
          : (_androidLight[type] ?? Colors.transparent);
    } else {
      return isIOS
          ? (_iosDark[type] ?? _androidDark[type] ?? Colors.transparent)
          : (_androidDark[type] ?? Colors.transparent);
    }
  }
}
