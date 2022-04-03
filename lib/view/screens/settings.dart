import 'package:em/logic/controllers/theme.dart';
import 'package:em/view/widgets/setting/logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/setting/darkmode.dart';
import '../widgets/setting/language.dart';
import '../widgets/setting/profile.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body:
     ListView(
       padding:EdgeInsets.all(26) ,
       children: [

         ProfileImage(),
         const SizedBox(height: 10,),
         Divider(color: Get.isDarkMode? Colors.white:Colors.grey,thickness: 2,),
         const SizedBox(height: 10,),

         Text("GENERAL".tr,
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
color: Colors.green
),),
         const SizedBox(height: 20,),
       DarkMode(),
         const SizedBox(height: 20,),
       Language(),
         const SizedBox(height: 20,),
       LogOut(),

       ],
     )
    );
  }
}


// Padding(padding: EdgeInsets.only(top: 10,
// bottom: 10),
// child: Container(
// height: 2,
//
// color: Colors.grey,
// ),),
// SizedBox(height: 20,),
// SizedBox(height: 40,),
//
//
// ],
// ),