import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  const ContainerUnder({
    required this.textType,
    required this.onPressed,
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode?Colors.green:Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          UtiliesText(text: text,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(onPressed: onPressed, child:
          UtiliesText(text: textType,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white, underLine: TextDecoration.underline),),

        ],

      ),
    );
  }
}
