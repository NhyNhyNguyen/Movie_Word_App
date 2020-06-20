
import 'dart:io';

import 'package:flutter/foundation.dart';

class UrlConstant{
  //static const String HOST = "http://10.0.2.2:9000";
  static const String HOST = "http://192.168.1.57:9000";
  static const String HOST_1 = "10.0.2.2:9000";
  static const String REGISTER = HOST + "/api/register";
  static const String LOGIN = HOST + "/api/auth";
  static const String PROFILE = HOST + "/api/profile";
  static const String EDIT = HOST + "/api/edit-profile";
  static const String RESET_PASS = HOST + "/api/reset-password";
  static const String IMAGE = HOST + "/api/image/";
  static const String POST_IMAGE = HOST + "/api/users/upload-avatar";


  static const String HOST_MOBILE= "http://192.168.1.57:9000/";
  static const String URL_FILM = HOST_MOBILE + "api/films/";
  static const String URL_IMAGE = HOST_MOBILE + "api/image/";
  static const String URL_COMMENT = HOST_MOBILE+ "api/comments/film/";
  static const String URL_GET_RATE = HOST_MOBILE + "api/films/get-rate?";
  static const String URL_PUT_RATE = HOST_MOBILE + "api/films/";   // /2/rate
  static const String URL_POST_COMMENT = HOST_MOBILE +"api/comments";
  static const String URL_GET_SHOWTIME = HOST_MOBILE + "api/showtimefilms/filmInDate?date=" ;
}