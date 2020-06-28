import 'dart:convert';

import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class  Booking{
  final int idReservation;
  final String name;
  final String poster;
  final String showTime;
  final String date;
  final List<String> seats;
  final String room;
  final int status;
  final String code;


  Booking({this.idReservation,this.name,this.poster, this.showTime, this.date, this.seats, this.status, this.room, this.code});

  factory Booking.fromJson(Map<String, dynamic> json) {
    List<String> list = [];
    if(json['seat'] != null){
      json['seat'].forEach((json){
        list.add(json);
      });
    }
    return Booking(
      idReservation: json['id'],
      name: json['filmName'],
      poster: json['filmPoster'],
      showTime: json['showTime'],
      seats: list,
      status: json['status'],
      room: json['room'],
      code: json['code']
    );
  }


}
