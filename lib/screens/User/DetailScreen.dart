import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
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

  UserDetail userDetail;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();


  Future<UserDetail> fetchUserDetail() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserDetail.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load userDetail');
    }
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
    //userDetail =
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
                        TextFieldWidget.buildTextField(
                            StringConstant.USERNAME,
                            userDetail.username,
                            Icon(Icons.account_circle),
                            TextInputType.text,
                            usernameController),
                        TextFieldWidget.buildTextField(
                            StringConstant.FULL_NAME,
                            userDetail.fullName,
                            Icon(Icons.edit),
                            TextInputType.text,
                            fullNameController),
                        TextFieldWidget.buildTextField(
                            StringConstant.EMAIL,
                            userDetail.email,
                            Icon(Icons.email),
                            TextInputType.visiblePassword,
                            emailController),
                        TextFieldWidget.buildTextField(
                            StringConstant.PHONE,
                            userDetail.phone,
                            Icon(Icons.phone_in_talk),
                            TextInputType.visiblePassword,
                            phoneController),
                        TextFieldWidget.buildTextField(
                            StringConstant.ADDRESS,
                            userDetail.address,
                            Icon(Icons.add_to_photos),
                            TextInputType.visiblePassword,
                            addressController),
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
