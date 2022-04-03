import 'package:em/logic/controllers/auth_controles.dart';
import 'package:em/logic/controllers/settingscontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class  ProfileImage extends StatelessWidget {
   ProfileImage({Key? key}) : super(key: key);
  final controller =Get.find<SettingsController>();
  final authController =Get.find<AuthControlles>();

  @override
  Widget build(BuildContext context) {
    return
      Obx(()=>
          Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            image: DecorationImage(
                              image: NetworkImage(authController.displayUserPhoto.value),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),),
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.capitalize(authController.displayUserName.value),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:Get.isDarkMode?Colors.white: Colors.black
                          ),),
                        const SizedBox(height: 5,),
                        Text(authController.displayUserEmail.value,
                          style: TextStyle(
                            fontSize: 11,fontWeight: FontWeight.bold,
                            color: Get.isDarkMode?Colors.white:Colors.black,
                          ),)
                      ],
                    )

                  ],
                ),

              ] ));
  }
}
