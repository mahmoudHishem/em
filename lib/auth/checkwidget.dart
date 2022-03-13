import 'package:em/logic/controllers/auth_controles.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckWidget extends StatelessWidget {

   CheckWidget({Key? key}) : super(key: key);
  final controller =Get.find<AuthControlles>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthControlles>(builder: (_){
      return Row(
        children: [
          InkWell(
            onTap: (){
              controller.checkBox();
            },
            child:  Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),

              ),child: controller.isCheckBox?
            Get.isDarkMode?
            Icon(Icons.done,color: Colors.pink,):Icon(Icons.done,color: Colors.green,)
                :
              Container(),
            ),
          ),
          SizedBox(width: 10,)
          ,Row(children: [
            UtiliesText(text: 'I accept',
                fontWeight: FontWeight.bold,
                fontSize: 18, color: Get.isDarkMode?
                Colors.white:Colors.black
                , underLine: TextDecoration.none),
            UtiliesText(text: 'Terms & conditions',
                fontWeight: FontWeight.bold,
                fontSize: 18, color: Get.isDarkMode?
                Colors.white:Colors.black
                , underLine: TextDecoration.underline),

          ],)
        ],
      );

    });
  }
}
