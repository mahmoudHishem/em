import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/routes/routes.dart';
import 'package:em/view/screens/mainScreen.dart';
import 'package:em/view/widgets/cart/cardempty.dart';
import 'package:em/view/widgets/cart/carttotal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/utilies.dart';
import '../widgets/cart/cartProductCard.dart';
class CardItem extends StatelessWidget {
   CardItem({Key? key}) : super(key: key);
  final controller =Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle:  true,
        title: Text('card item'),
        elevation: 0,
        backgroundColor: Get.isDarkMode ?Colors.black:Colors.green,
        actions: [
          IconButton(onPressed: (){
controller.clearAllProducts();
}, icon: Icon(Icons.backspace))
        ],
      ),
      body: Obx((
      ){if (controller.productsMap.isEmpty){
        return CardEmpty();
      }else{
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 570,
                  child: ListView.separated(itemBuilder: (context,index){
                    return CartProductCard(
                      quantity: controller.productsMap.values.toList()[index],
                      index: index,
                      welcome: controller.productsMap.keys.toList()[index],
                    );
                  }, separatorBuilder:(context ,index){
                    return SizedBox(height: 20,);
                  } , itemCount: controller.productsMap.length)


              ),
              Padding(padding: EdgeInsets.only(bottom: 5),
                child:  CartTotal()
                ,)
            ],
          ),
        );
      }

      }
      )
    ));
  }
}
