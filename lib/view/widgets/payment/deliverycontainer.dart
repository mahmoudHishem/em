import 'package:em/logic/controllers/auth_controles.dart';
import 'package:em/logic/controllers/paymentcontroller.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
class DeliveryContainer extends StatefulWidget {
  const DeliveryContainer({Key? key}) : super(key: key);

  @override
  _DeliveryContainerState createState() => _DeliveryContainerState();
}

class _DeliveryContainerState extends State<DeliveryContainer> {
  final authController = Get.find<AuthControlles>();
  int radioContainerIndex=1;
  bool changeColors =false;
  final  controller =Get.find<PayMentController>();
  final TextEditingController phoneController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          title: "ASroo Shop",
          phone: controller.phoneNumber.value,
          name:' asroo shop',
          value: 1,
          icon: Container(),
          address: "Egypt,Elmahalla Elkobra ",
          color:changeColors ? Colors.white:Colors.grey.shade300 ,
          onChanged: (int ? value){
            setState(() {
            radioContainerIndex =value!;
            changeColors=!changeColors;
          });

          }
        ),
        const
        SizedBox(height: 10,),
       Obx(()=> buildRadioContainer(

           title: "ASroo Shop",
           phone: controller.phoneNumber.value,
           name:authController.displayUserName.value,
           value: 2,
           icon: InkWell(
             onTap: (){
               Get.defaultDialog(
                   title: "Enter your Number",
                   titleStyle: TextStyle(
                       fontSize: 16,
                       color: Colors.black,
                       fontWeight: FontWeight.bold
                   ),
                   backgroundColor: Colors.white,
                   radius: 10,
                   textCancel: "Cancel"
                   ,confirmTextColor: Colors.black,
                   textConfirm: "Save",
                   cancelTextColor: Colors.black,
                   onCancel: (){
                     Get.toNamed(Routes.paymentscreen);
                   },
                   onConfirm: (){
                     Get.back();
                     controller.phoneNumber.value=phoneController.text;
                   },
                   buttonColor: Get.isDarkMode? Colors.pink:Colors.green,
                   content: Padding(padding: EdgeInsets.all(15),
                     child:   TextFormField(
                       controller: phoneController,
                       style: const TextStyle(
                           color: Colors.black
                       ),
                       keyboardType: TextInputType.text,
                       maxLength: 11,

                       onFieldSubmitted: (value){
                         phoneController.text=value;
                       },
                       cursorColor: Colors.black,
                       decoration: InputDecoration(
                           fillColor: Get.isDarkMode? Colors.pink.withOpacity(.1):Colors.green.withOpacity(.4),
                           focusColor: Colors.red,
                           prefixIcon:  Icon(Icons.phone,
                             color: Get.isDarkMode ? Colors.pink:Colors.green,),filled: true,
                           suffixIcon: IconButton(onPressed: (){
                             phoneController.clear();
                           }, icon: Icon(
                             Icons.close,
                             color: Colors.black,
                           )),

                           hintText: 'Enter your phone Number',
                           hintStyle:const TextStyle(
                               color: Colors.black45,
                               fontSize: 16,
                               fontWeight: FontWeight.w500
                           ),
                           focusedBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(10)),
                           enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(10)),
                           focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(10)),
                           errorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(10))

                       ),
                     ) ,)
               );
             },
             child: Icon(Icons.contact_phone,
               size: 23,
               color: Get.isDarkMode?Colors.pink:Colors.green,),
           ),
           address: controller.address.value,
           color:changeColors ? Colors.grey.shade300:Colors.white ,
           onChanged: (int ?value){
             setState(() {
               radioContainerIndex =value!;
               changeColors=!changeColors;
             });
             controller.updatePosition();
           }
       ))

      ],
    );
  }
  Widget buildRadioContainer(
      {
        required Color color,
        required int value,
        required Function onChanged,
        required String name,
        required String phone,
        required String address,
        required String title,
        required Widget icon,




      }
      ){

    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value:value ,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),

            onChanged:(int ?value){
              onChanged(value);
            } ,
          ),
          const SizedBox(width: 5,),
          Padding(padding: EdgeInsets.only(top: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UtiliesText(text: title,
                    fontWeight: FontWeight.bold, fontSize: 15,
                    color: Colors.black, underLine: TextDecoration.none),
                const  SizedBox(height: 10,),
                UtiliesText(text: name,
                    fontWeight: FontWeight.bold, fontSize: 15,
                    color: Colors.black,
                    underLine: TextDecoration.none),
                const  SizedBox(height: 10,),

                
               Row(children: [
                 const Text(" 🇪🇬+02  "),
                 UtiliesText(text: phone,
                     fontWeight: FontWeight.normal,
                     fontSize: 15,
                     color: Colors.black,
                     underLine: TextDecoration.none),
                 const SizedBox(width: 80,)
                 ,
                 SizedBox(child: icon,)
               ],),
                const  SizedBox(height: 10,),
                UtiliesText(text: address,
                    fontWeight: FontWeight.bold, fontSize: 15,
                    color: Colors.black,
                    underLine: TextDecoration.none),


              ],
            ),
          )
        ],
      ),
    );

  }

}

