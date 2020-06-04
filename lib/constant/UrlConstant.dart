

import 'dart:io';

import 'package:flutter/foundation.dart';

class UrlConstant{
  static const String HOST = "http://10.0.2.2:9000";
  static const String HOST_1 = "10.0.2.2:9000";
  static const String REGISTER = HOST + "/api/register";
  static const String LOGIN = HOST + "/api/auth";
  static const String PROFILE = HOST + "/api/profile";
  static const String EDIT = HOST + "/api/edit-profile";
  static const String RESET_PASS = HOST + "/api/reset-password";
  static const String IMAGE = HOST + "/api/image/";
  static const String POST_IMAGE = HOST + "/api/users/upload-avatar";

  String get hostname {
    if (kIsWeb) {
      return 'http://localhost:9000';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:9000';
    } else {
      return 'http://localhost:9000';
    }
  }
}