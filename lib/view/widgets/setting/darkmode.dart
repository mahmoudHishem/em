import 'package:em/logic/controllers/settingscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/theme.dart';
class DarkMode extends StatelessWidget {
   DarkMode({Key? key}) : super(key: key);
  final controller =Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return
   Obx(()=>
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          Material(
            child: Row(
              children: [
                Container(height: 40,width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(45),

                  ),child:   Icon(Icons.dark_mode,
                    size: 20,color: Colors.white,),
                ),
                const SizedBox(width: 25,),
                Text("Dark Mode".tr,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:Get.isDarkMode? Colors.white: Colors.black
                  ),),
              ],
            ),
          ),
           Switch(
               activeColor:Get.isDarkMode?Colors.pink: Colors.green,
               activeTrackColor: Get.isDarkMode?Colors.pink: Colors.green,
               value: controller.switchValue.value,
               onChanged: (value){
                 ThemeController().ChangesTheme();
                 controller.switchValue.value =value;
               })

         ],
       )) ;
          }
        }
// Expanded(
// child: TextButton(
// onPressed: (){

// },
// child: Text('DarkMode',
// style: TextStyle(
// color: Get.isDarkMode?Colors.white:Colors.black
// ),),
// ),
// )