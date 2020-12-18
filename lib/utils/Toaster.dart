
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster{

  void showToast(String _msg) {

    Fluttertoast.showToast(
        msg: _msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlue,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

}