import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/User/ButtonGradientSmall.dart';
import 'package:MovieWorld/screens/User/ChoosePage.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/History.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/ResetPassword.dart';
import 'package:MovieWorld/screens/User/SignUpScreen.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:MovieWorld/services/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../ButtonGradient.dart';
import 'Avatar.dart';
import 'ResetPass.dart';

class ChooseProfile extends StatefulWidget {
  @override
  _ChooseProfile createState() => _ChooseProfile();
}

class _ChooseProfile extends State<ChooseProfile> {
  String type = "profile";
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
        StringConstant.EDIT,
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen()))
            });
  }

  void choseOption(type) {
    setState(() {
      this.type = type;
    });
  }

  @override
  initState() {
    super.initState();
    ConstantVar.isLogin = false;
    if (ConstantVar.userDetail != null) {
      usernameController.text = ConstantVar.userDetail.username;
      fullNameController.text = ConstantVar.userDetail.fullName;
      addressController.text = ConstantVar.userDetail.address;
      phoneController.text = ConstantVar.userDetail.phone;
      emailController.text = ConstantVar.userDetail.email;
    } else {
      UserDetail.fetchUserDetail(ConstantVar.jwt).then((value) => setState(() {
            usernameController.text = ConstantVar.userDetail.username;
            fullNameController.text = ConstantVar.userDetail.fullName;
            addressController.text = ConstantVar.userDetail.address;
            phoneController.text = ConstantVar.userDetail.phone;
            emailController.text = ConstantVar.userDetail.email;
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ConstantVar.userDetail != null) {
      return  MainLayOut.getMailLayout(
              context,
              Container(
                color: ColorConstant.VIOLET,
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Avatar(imageUrl: UrlConstant.IMAGE + ConstantVar.userDetail.avt,
                         username:  usernameController.text,email: emailController.text),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
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
              "USER",
              "User Detail");
    } else {
      return LoginScreen();
    }
  }
}
