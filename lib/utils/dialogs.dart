import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog {
  static show (BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.9),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          onWillPop: () async => false,
        );
      },
    );
  }

  static dissmiss(BuildContext context) {
    Navigator.pop(context);
  }
}