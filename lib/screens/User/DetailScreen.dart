import 'dart:convert';
import 'dart:io';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ButtonGradientLarge.dart';
import 'UploadImage.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  UserDetail userDetail;
  bool isLoading = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  Widget _SaveBtn() {
    return ButtonGradientLarge(
        StringConstant.SAVE_CHANGES,
        () => {
          postUserDetail()
            });
  }


  Future<http.Response> postUserDetail() async {
    final http.Response response = await http.put(
      UrlConstant.EDIT,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':
        'Bearer ' + ConstantVar.jwt,
      },
      body: jsonEncode(<String, String>{
        "username": usernameController.text,
        "fullName": fullNameController.text,
        "password": passwordController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "address": addressController.text,
        "password":"123"
      }),
    );
    if (response.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ChooseProfile()));
      UserDetail.fetchUserDetail(ConstantVar.jwt);
    } else {
    }
    return response;
  }

  @override
  initState() {
    super.initState();
    ConstantVar.isLogin = false;
    if (ConstantVar.userDetail != null){
      usernameController.text = ConstantVar.userDetail.username;
      fullNameController.text = ConstantVar.userDetail.fullName;
      addressController.text = ConstantVar.userDetail.address;
      phoneController.text = ConstantVar.userDetail.phone;
      emailController.text = ConstantVar.userDetail.email;}
    else{
      UserDetail.fetchUserDetail(ConstantVar.jwt).then((value) => setState((){
      }));    }

  }

  @override
  Widget build(BuildContext context) {
    if (ConstantVar.userDetail != null){
      return MainLayOut.getMailLayout(
          context,
          Container(
            color: ColorConstant.VIOLET,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  Text(StringConstant.EDIT,
//                      style: StyleConstant.headerTextStyle),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                 width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                          AssetImage("assets/profile.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  FlatButton(
                    child: Text(StringConstant.CHANGE_PICTURE, style:TextStyle(
                      color: ColorConstant.BLUE_TEXT,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Open Sans",
                      decoration: TextDecoration.underline
                    ) ),
                    onPressed: ()=>{
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadImageDemo()))
                    },
                  ),

                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFieldWidget.buildTextField(
                            StringConstant.USERNAME,
                            StringConstant.USERNAME_HINT,
                            Icon(Icons.account_circle, color: Colors.white),
                            TextInputType.text,
                            usernameController),
                        TextFieldWidget.buildTextField(
                            StringConstant.EMAIL,
                            StringConstant.EMAIL_HINT,
                            Icon(Icons.email, color: Colors.white),
                            TextInputType.text,
                            emailController),
                        TextFieldWidget.buildTextField(
                            StringConstant.FULL_NAME,
                            StringConstant.FULL_NAME_HINT,
                            Icon(Icons.assessment, color: Colors.white),
                            TextInputType.text,
                            fullNameController),
                        TextFieldWidget.buildTextField(
                            StringConstant.PHONE,
                            StringConstant.PHONE_HINT,
                            Icon(Icons.phone, color: Colors.white),
                            TextInputType.text,
                            phoneController),
                        TextFieldWidget.buildTextField(
                            StringConstant.ADDRESS,
                            StringConstant.ADDRESS_HINT,
                            Icon(Icons.assignment, color: Colors.white),
                            TextInputType.text,
                            addressController),
                      ]),
                    ),
                  ),
                  _SaveBtn(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  )
                ],
              ),
            ),
          ),
          "USER");}
    else {
      return LoginScreen();
    }
  }
}
