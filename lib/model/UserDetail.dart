import 'dart:convert';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:http/http.dart' as http;

class UserDetail {
  int id;
  String username;
  String fullName;
  String password;
  String email;
  String address;
  String phone;
  String avt;

  UserDetail(
      {
      this.id,
      this.username,
      this.password,
      this.fullName,
      this.address,
      this.phone,
      this.email,
      this.avt});

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      avt: json['avatar'],
    );
  }

  static Future<bool> fetchUserDetail(String jwt) async {
    if (jwt != "" || jwt != null) {
      final response = await http.get(UrlConstant.PROFILE, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      });
      print(json.decode(response.body));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        ConstantVar.isLogin = true;
        ConstantVar.userDetail =
            UserDetail.fromJson(json.decode(response.body));
        return true;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        ConstantVar.isLogin = false;
        ConstantVar.userDetail = null;
        return false;
      }
    }else{
      ConstantVar.isLogin = false;
      ConstantVar.userDetail = null;
    }
    return false;
  }
}
