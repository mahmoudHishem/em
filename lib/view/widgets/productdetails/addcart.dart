import 'package:em/model/product_models.dart';
import 'package:em/routes/routes.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cartcontroller.dart';
 class AddCart extends StatelessWidget {
    AddCart({Key? key,
      required this.welcome,
    required this.price
    }) : super(key: key);
final Welcome welcome;
final double price;
final controller =Get.find<CartController>();
   @override
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.all(25),
       child: Row(
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               UtiliesText(text: "Price",
                   fontWeight: FontWeight.bold,
                   fontSize: 17,
                   color: Colors.grey,
                   underLine: TextDecoration.none),
               Text("\$$price" ,
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   color:Get.isDarkMode?Colors.white: Colors.black,
                   height: 1.5
                 ),
                 )
             ],
           ),SizedBox(width: 20,),

          Expanded(
            child: SizedBox(height: 60,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                    elevation: 0,
                    primary:Get.isDarkMode?Colors.pink:Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    )
                ) ,

                onPressed: (){
                  controller.addProductCart(welcome);
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add to Cart",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    ),
                    SizedBox(width: 10,)
                    ,
                    Icon(Icons.shopping_cart,size: 22,color: Colors.white,)
                  ],
                ),
              ),
            ))

         ]
     )
     );
   }
 }
