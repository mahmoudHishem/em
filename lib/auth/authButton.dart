import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String Text;
  final Function() onPressed;
  const AuthButton({
    required this.Text,
    required this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style:
        ElevatedButton.styleFrom(primary: Get.isDarkMode ? Colors.pink:Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        minimumSize: Size(360, 50)),
        child: UtiliesText(
            text: Text,
            fontWeight: FontWeight.bold,
            fontSize: 20, color: Colors.white,
            underLine: TextDecoration.none));
  }
}
