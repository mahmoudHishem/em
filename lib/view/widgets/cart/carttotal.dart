import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/utilies.dart';
class CartTotal extends StatelessWidget {
   CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    Container(
        padding: EdgeInsets.all(25),
    child: Row(
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    UtiliesText(text: 'Total',
    fontWeight: FontWeight.bold,
    fontSize: 16, color: Colors.grey, underLine: TextDecoration.none),
    Text("\$${controller.total.toStringAsFixed(2)}",
    style: TextStyle(color: Get.isDarkMode ? Colors.white:Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold
    ,height: 1.5),),

    ],
    ),
    SizedBox(width: 20,),
    Expanded(child: SizedBox(
    height: 60,
    child:
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),

    ),
    elevation: 0,
    primary: Get.isDarkMode? Colors.pink: Colors.green
    ),
    onPressed: (){
      Get.toNamed(Routes.paymentscreen);
    }, child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('CheckOut',style: TextStyle(fontSize: 20,
    color: Colors.white),),
    Icon(Icons.shopping_cart)
    ],
    ) ,)
    )  )      ],
    ),
    ));
  }
}
