import 'dart:convert';
import 'dart:io';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  Future<UserDetail> userDetail;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();


   fetchUserDetail() async {
    final http.Response response = await http.get(
      UrlConstant.PROFILE,
      headers: {  HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Basic eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0cmFuZyIsInNjb3BlcyI6IiIsImlhdCI6MTU5MDA3NTQwNiwiZXhwIjoxNTkwMDkzNDA2fQ.jtXFWPUOxdrKnwRCTu8db-SJJdrmCvfKSO7jwz7Kdmo"},
    );
    print(json.decode(response.body));

   /* if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(json.decode(response.body));
      return  UserDetail.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load userDetail');
    }*/
  }

  Widget _SaveBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorConstant.GREEN,
        child:
            Text(StringConstant.SAVE, style: StyleConstant.buttonTextStyle),
      ),
    );
  }

  Widget _Cancel() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {

        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorConstant.GREY,
        child:
        Text(StringConstant.CANCEL, style: StyleConstant.buttonTextStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   fetchUserDetail();
    return MainLayOut.getMailLayout(
        context,
        Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(StringConstant.SIGN_UP,
                    style: StyleConstant.headerTextStyle),
                SizedBox(
                  height: 13,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: ColorConstant.WHITE,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 15),
                            blurRadius: 15),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, -10),
                            blurRadius: 10)
                      ]),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
//                        TextFieldWidget.buildTextField(
//                            StringConstant.USERNAME,
//                            userDetail.then((value) => value.username).toString(),
//                            Icon(Icons.account_circle),
//                            TextInputType.text,
//                            usernameController),
//                        TextFieldWidget.buildTextField(
//                            StringConstant.FULL_NAME,
//                            userDetail.then((value) => value.fullName).toString(),
//                            Icon(Icons.edit),
//                            TextInputType.text,
//                            fullNameController),
//                        TextFieldWidget.buildTextField(
//                            StringConstant.EMAIL,
//                            userDetail.then((value) => value.email).toString(),
//                            Icon(Icons.email),
//                            TextInputType.visiblePassword,
//                            emailController),
//                        TextFieldWidget.buildTextField(
//                            StringConstant.PHONE,
//                            userDetail.then((value) => value.phone).toString(),
//                            Icon(Icons.phone_in_talk),
//                            TextInputType.visiblePassword,
//                            phoneController),
//                        TextFieldWidget.buildTextField(
//                            StringConstant.ADDRESS,
//                            userDetail.then((value) => value.address).toString(),
//                            Icon(Icons.add_to_photos),
//                            TextInputType.visiblePassword,
//                            addressController),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _SaveBtn(),
                    _Cancel(),
                  ],
                )
              ],
            ),
          ),
        ),
        "USER");
  }
}
