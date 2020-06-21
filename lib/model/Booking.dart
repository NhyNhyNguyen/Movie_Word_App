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
  final String room;
  final int status;


  Booking({this.name, this.showTime, this.date, this.seats, this.status, this.room});

  factory Booking.fromJson(Map<String, dynamic> json) {
    List<String> list = [];
    json['seat'].forEach((json){
      list.add(json);
    });
    return Booking(
      name: json['filmName'],
      showTime: json['showTime'],
      seats: list,
      status: json['status'],
        room: json['room']
    );
  }


}
