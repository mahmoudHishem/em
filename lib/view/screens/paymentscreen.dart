import 'package:em/view/widgets/payment/deliverycontainer.dart';
import 'package:em/view/widgets/payment/paymentmethod.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: Text('PayMent '),
        elevation: 0,
        backgroundColor: Get.isDarkMode ?Colors.black:Colors.green,
      ),
      body: SingleChildScrollView(
        child:
        Padding(padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UtiliesText(text: "Shipping to",
                fontWeight: FontWeight.bold,
                fontSize: 24, color: Get.isDarkMode? Colors.white:Colors.black,
                underLine: TextDecoration.none)
            ,const SizedBox(height: 20,),
          DeliveryContainer()
          ,const SizedBox(height: 20,),

        UtiliesText(text: "Payment Method",
                fontWeight: FontWeight.bold,
                fontSize: 24, color: Get.isDarkMode? Colors.white:Colors.black,
                underLine: TextDecoration.none)
            ,const SizedBox(height: 20,),
           PayMentType(),
          const SizedBox(height: 20,),
            Center(
              child: UtiliesText(text: " Total 200\$",
                  fontWeight:FontWeight.bold,
                  fontSize: 20,
                  color: Get.isDarkMode? Colors.white:Colors.black,
                  underLine: TextDecoration.none),

            ),
            SizedBox(height: 20,),
Center(
  child:             SizedBox(height: 50,
    width:150 ,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),

        ),
        elevation: 0,
        primary: Get.isDarkMode? Colors.pink:Colors.green,

      ),
      onPressed: (){},
      child: Text("Pay Now",
        style: TextStyle(
            fontSize: 20,
            color: Colors.white
        ),),
    ),)
  ,
)
        ],
        ),),
      ),
    );
  }
}
