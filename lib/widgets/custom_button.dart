import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      this.onPressed,
      this.isLoading = false});
  final String buttonName;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(16)),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
              : Text(
                  buttonName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
