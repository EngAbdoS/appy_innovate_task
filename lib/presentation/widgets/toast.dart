import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 toastWidget(String message)
{
   Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      textColor: Colors.black,
      backgroundColor: Colors.lightBlue.withOpacity(0.7),
      fontSize: 16.0);


}