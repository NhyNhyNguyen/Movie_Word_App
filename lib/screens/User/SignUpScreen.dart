import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/modal.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:MovieWorld/utils/DateTimeUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../ButtonGradientLarge.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  final String jwt;

  const SignUpScreen({Key key, this.jwt}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState(this.jwt);
}

class _SignUpScreenState extends State<SignUpScreen> {
  final String jwt;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  _SignUpScreenState(this.jwt);

  Future<http.Response> postUserDetail(BuildContext context) async {
    final http.Response response = await http.post(
      UrlConstant.REGISTER,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": usernameController.text,
        "fullName": passwordController.text,
        "password": fullNameController.text,
        "address": addressController.text,
        "phone": phoneController.text,
        "email": emailController.text
      }),
    );
    if (response.statusCode == 200) {
      print("sign_up success");
      Modal.showSimpleCustomDialog(
          context, "Please enter mail to determine", null);
    } else {
      Modal.showSimpleCustomDialog(
          context, "Sign up fail", null);
    }
    return response;
  }

  Future<bool> confirmDetail(String jwt) async {
    print(UrlConstant.CONFIRM_ACCOUNT + "?token=" + jwt);
    final response =
        await http.get(UrlConstant.CONFIRM_ACCOUNT + "?token=" + jwt, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json; charset=utf-8',
    });
    print(json.decode(response.body));

    if (response.statusCode == 200) {
      Modal.showSimpleCustomDialog(
          context,
          "Create account successfull!",
          (c) => {
            Navigator.of(c, rootNavigator: true).pop('dialog'),
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen(handel: "")))
              });
      ConstantVar.registerToken = "";
    } else {
      Modal.showSimpleCustomDialog(
          context,
          "Create account fail!",null);
      ConstantVar.registerToken = "";
    }

    return false;
  }

  Widget _signUpBtn(BuildContext context) {
    return ButtonGradientLarge(StringConstant.REGISTER_NOW, () {
      if (_formKey.currentState.validate()) {
        postUserDetail(context);
      }
    });
  }

  @override
  void initState() {
    if (jwt != "") {
      print('confirm account');
      confirmDetail(jwt);
    }
    print('confirm account' + jwt);

    usernameController.text = "nhinhi";
    passwordController.text = "123123";
    fullNameController.text = "nhinhi";
    addressController.text = "Ha lang quang phu quang dien";
    phoneController.text = "12345678910";
    emailController.text = "dddnhi@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Create your account",
                    style: StyleConstant.headerTextStyle),
                SizedBox(
                  height: 13,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: ColorConstant.LIGHT_VIOLET,
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
                            StringConstant.USERNAME_HINT,
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            TextInputType.text,
                            usernameController),
                        TextFieldWidget.buildTextField(
                            StringConstant.PASSWORD,
                            StringConstant.PASSWORD_HINT,
                            Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            TextInputType.visiblePassword,
                            passwordController),
                        TextFieldWidget.buildTextField(
                            StringConstant.FULL_NAME,
                            StringConstant.FULL_NAME_HINT,
                            Icon(Icons.edit, color: Colors.white),
                            TextInputType.text,
                            fullNameController),
                        TextFieldWidget.buildTextField(
                            StringConstant.EMAIL,
                            StringConstant.EMAIL_HINT,
                            Icon(Icons.email, color: Colors.white),
                            TextInputType.visiblePassword,
                            emailController),
                        TextFieldWidget.buildTextField(
                            StringConstant.PHONE,
                            StringConstant.PHONE_HINT,
                            Icon(
                              Icons.phone_in_talk,
                              color: Colors.white,
                            ),
                            TextInputType.visiblePassword,
                            phoneController),
                        TextFieldWidget.buildTextField(
                            StringConstant.ADDRESS,
                            StringConstant.ADDRESS_HINT,
                            Icon(Icons.add_to_photos, color: Colors.white),
                            TextInputType.visiblePassword,
                            addressController),
                      ],
                    ),
                  ),
                ),
                _signUpBtn(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                )
              ],
            ),
          ),
        ),
        "USER",
        "Sign up");
  }
}
