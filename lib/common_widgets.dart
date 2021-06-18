import 'package:flutter/material.dart';

TextStyle mediumTextStyle(Color color, double fontsize) {
  return TextStyle(
      height: 1.5,
      fontSize: fontsize,
      fontWeight: FontWeight.bold,
      color: color);
}

TextStyle regularTextStyle(Color color, double fontsize) {
  return TextStyle(
      fontSize: fontsize, fontWeight: FontWeight.w200, color: color);
}

TextFormField textfield(fields, int i, TextInputType type, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    validator: fields[i].validations.required == 'true'
        ? (value) {
            if (value.isEmpty || value == null) {
              return 'Enter a valid value!';
            }
            return null;
          }
        : null,
    keyboardType: type,

    decoration: InputDecoration(
        hintText: fields[i].title,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey)),
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey))),
  );
}


void  snackbar(GlobalKey<ScaffoldState> _scaffoldKey,String message){
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(message),
  ));
}

