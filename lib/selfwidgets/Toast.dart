import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void Toast(String text) {
  Fluttertoast.showToast(
      msg: text,
      backgroundColor: Colors.grey[200],
      textColor: Colors.black,
  );
}