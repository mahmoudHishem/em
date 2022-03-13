import 'package:em/logic/controllers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
          onPressed: (){
            ThemeController().ChangesTheme();
          },
          child: Text('DarkMode',
            style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black
            ),),
        ),
      ),
    );
  }
}
