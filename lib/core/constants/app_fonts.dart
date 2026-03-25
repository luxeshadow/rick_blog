import 'dart:io';
import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  static const String inter = 'Inter';  
  static const String sfPro = 'SFPro';   

  static String get() {
    return Platform.isIOS ? sfPro : inter;
  }

}
