import 'package:MovieWorld/screens/Homepage/NowshowingScreen.dart';
import 'package:MovieWorld/screens/Menu/SideBarMenu.dart';
import 'package:MovieWorld/screens/User/ChoosePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: NowshowingScreen(),
    ),
  ));
}