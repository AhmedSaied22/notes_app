import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

void snackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 700),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 50,
        right: 50,
      ),
      backgroundColor: kPrimaryColor,
      content: const Center(
          child: Text(
        'Note deleted',
        style: TextStyle(color: Colors.black, fontSize: 16),
      )),
    ),
  );
}
