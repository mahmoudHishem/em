import 'package:em/logic/controllers/auth_controles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/settings.dart';
class LogOut extends StatelessWidget {
  LogOut({Key? key}) : super(key: key);
  final controller =Get.find<AuthControlles>();

  @override
  Widget build(BuildContext context) {
    return
     GetBuilder<AuthControlles>(
       init: controller,
         builder: (controller)=> InkWell(onTap: (){
           Get.defaultDialog(
               title: "LogOut".tr,
               titleStyle:const TextStyle(
                   fontSize: 18,
                   color: Colors.black,
                   fontWeight: FontWeight.bold
               ),
               middleText: "Are you sure you need to logout",
               middleTextStyle: const TextStyle(
                 fontSize: 18,
                 color: Colors.black,

               ),cancelTextColor: Colors.white,
               backgroundColor: Colors.grey,
               radius: 10,
               textCancel: "No",
               textConfirm: "Yes",
               confirmTextColor: Colors.white,
               onCancel: (){
                 Get.back();
               },
               buttonColor: Get.isDarkMode? Colors.pink:Colors.green,

               onConfirm: (){
                 controller.signOutFromApp();
               }

           );
         },
           splashColor: Get.isDarkMode? Colors.pink:Colors.green.withOpacity(.4),
           borderRadius: BorderRadius.circular(12),
           customBorder: const StadiumBorder(),
           child: Row(mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Container(height: 40,width: 40,
                 decoration: BoxDecoration(
                   color: Colors.blueAccent,
                   borderRadius: BorderRadius.circular(45),

                 ),child:  IconButton(
                   onPressed: (){},
                   icon: const Icon(Icons.logout,
                     size: 20,
                     color: Colors.white,),
                 ),
               ),
               const SizedBox(width: 25,),
               Text("Logout".tr,
                 style: TextStyle(
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                     color: Get.isDarkMode?Colors.white:Colors.black
                 ),),

             ],
           ),
         ))
      ;
  }
}
