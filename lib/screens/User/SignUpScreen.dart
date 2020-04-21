import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:MovieWorld/utils/DateTimeUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();



  Widget _signUpBtn() {
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
        color: ColorConstant.RED,
        child: Text(StringConstant.SIGN_UP, style: StyleConstant.buttonTextStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: AppBar(
                backgroundColor: ColorConstant.RED,
                title: Stack(
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(ImageConstant.LOGO1, height: 60),
                        Text(
                          StringConstant.APP_NAME,
                          style: TextStyle(
                            color: ColorConstant.YELLOW,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          body: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20.0),
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
                                  StringConstant.USERNAME_HINT,
                                  Icon(Icons.account_circle),
                                  TextInputType.text, usernameController),
                              TextFieldWidget.buildTextField(
                                  StringConstant.PASSWORD,
                                  StringConstant.PASSWORD_HINT,
                                  Icon(Icons.vpn_key),
                                  TextInputType.visiblePassword, passwordController),
                              TextFieldWidget.buildTextField(
                                  StringConstant.FULL_NAME,
                                  StringConstant.FULL_NAME_HINT,
                                  Icon(Icons.edit),
                                  TextInputType.text, fullNameController),
                              TextFieldWidget.buildTextField(
                                  StringConstant.EMAIL,
                                  StringConstant.EMAIL_HINT,
                                  Icon(Icons.email),
                                  TextInputType.visiblePassword, emailController),
                              TextFieldWidget.buildTextField(
                                  StringConstant.PHONE,
                                  StringConstant.PHONE_HINT,
                                  Icon(Icons.phone_in_talk),
                                  TextInputType.visiblePassword, phoneController),
                              TextFieldWidget.buildTextField(
                                  StringConstant.ADDRESS,
                                  StringConstant.ADDRESS_HINT,
                                  Icon(Icons.add_to_photos),
                                  TextInputType.visiblePassword, addressController),
                            ],
                          ),

                        )
                        ,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _signUpBtn(),
                    ],
                  ),
                ),
              ),

              Container(
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: ColorConstant.RED,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: (){},
                          child: Image.asset(ImageConstant.HOME_GRAY, height: 45),
                        ),InkWell(
                          onTap: (){},
                          child: Image.asset(ImageConstant.CALENDAR_GRAY, height: 45),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Image.asset(ImageConstant.FILM_GRAY, height: 45),
                        ),InkWell(
                          onTap: (){},
                          child: Image.asset(ImageConstant.PERSON_GRAY, height: 60),
                        )

                      ],
                    ),
                  ),
                )
                ,
              )
            ],
          ),
        ));
  }
}
