import 'package:em/logic/controllers/settingscontroller.dart';
import 'package:em/utilis/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
   Language({Key? key}) : super(key: key);
  final controller =Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return
    GetBuilder<SettingsController>(
      init: controller,
        builder: (_)=>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          child:Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(45),

                ),child:   Icon(Icons.language_rounded,
                size: 20,
                color: Colors.white,),
              ),SizedBox(width: 25,),
              Text("Language".tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:Get.isDarkMode?Colors.white: Colors.black
                ),),
            ],
          ) ,
        ),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                  color: Get.isDarkMode?Colors.white:Colors.black)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(Icons.arrow_drop_down,
                color: Get.isDarkMode?Colors.white:Colors.black,),
              items:[
                DropdownMenuItem(child:
                Text(arabic,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
                  value: ara,),

                DropdownMenuItem(child:
                Text(english,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
                  value: ene,),

                DropdownMenuItem(child:
                Text(france,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
                  value: frf,),
              ] ,
              value: controller.langLocal,
              onChanged: (value){
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value) );

              },),
          ),

        )

      ],
    ));
  }
}
