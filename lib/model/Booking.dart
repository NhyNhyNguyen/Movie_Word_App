import 'dart:convert';

import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class  Booking{
  final String name;
  final String showTime;
  final String date;
  final List<String> seats;


  Booking({this.name, this.showTime, this.date, this.seats});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      name: json['name'],
      showTime: json['showTime'],
      date: json['date'],
      seats: json['']
    );
  }

}
