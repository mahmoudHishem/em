import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/model/product_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/product_models.dart';

class CartProductCard extends StatelessWidget {
final Welcome welcome;
final int index;
final int quantity;
   CartProductCard(

      {required this.welcome,
        required this .index,
        required this.quantity,
        Key? key}) : super(key: key);
  final controller = Get.find<CartController>();



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: EdgeInsets.only(left: 20,right: 20,top: 5),
      decoration: BoxDecoration(
        color: Get.isDarkMode? Colors.pink.withOpacity(.7):Colors.green.withOpacity(.5),
borderRadius: BorderRadius.circular(20),


      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Row(
          children: [
            Container(
              height: 120,
              width: 100,
              margin: EdgeInsets.only(left: 15,),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(welcome.image),
                      fit: BoxFit.cover
                  )
              ),
            ),SizedBox(width: 20,
            ),
            Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(welcome.title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ?Colors.white:Colors.black,
                      fontSize: 14,fontWeight: FontWeight.bold

                  ),),SizedBox(height: 20,),
                Text("\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ?Colors.white:Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold

                  ),),

              ],
            )),
           SizedBox(height: 60,),
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Row(
                 children: [
                   IconButton(onPressed: (){
                     controller.removeProductsFarmCart(welcome);

                   }, icon: Icon(Icons.remove_circle,
                     color: Get.isDarkMode? Colors.white:Colors.black,)),
                   Text("$quantity",
                     style: TextStyle(
                         overflow: TextOverflow.ellipsis,
                         color: Get.isDarkMode ?Colors.white:Colors.black,
                         fontSize: 16,fontWeight: FontWeight.bold

                     ),),
                   IconButton(onPressed: (){
                     controller.addProductCart(welcome);

                   }, icon: Icon(Icons.add_circle,
                     color: Get.isDarkMode? Colors.white:Colors.black,

                   )),

                 ],
               ),
               IconButton(onPressed: (){
                 controller.removeOneProduct(welcome);
               }, icon: Icon(Icons.delete,
               color:Get.isDarkMode? Colors.red:Colors.black,
               size: 20,))
             ],
           )
          ],
        ),
]
    ),
    );
  }
}
