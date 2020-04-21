import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget {
  static Widget buildTextField(String name, String hint, Icon icon,
      TextInputType textInputType, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(name, style: StyleConstant.normalTextStyle),
        Container(
          alignment: Alignment.centerLeft,
          height: 55 ,
          child: TextFormField(
            keyboardType: textInputType,
            style: StyleConstant.normalTextStyle,
            decoration: InputDecoration(
                enabledBorder: StyleConstant.enabledBorder,
                focusedBorder: StyleConstant.focusedBorder,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: icon,
                hintText: hint,
                hintStyle: StyleConstant.hintTextStyle),
            controller: controller,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter ${name.toLowerCase()}';
              }
              return null;
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
