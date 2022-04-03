import 'package:em/logic/controllers/product_controller.dart';
import 'package:em/model/product_models.dart';
import 'package:em/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartController extends  GetxController {
  var productsMap = {}.obs;


  void addProductCart(Welcome Welcome) {
    if (productsMap.containsKey(Welcome))

    {
      productsMap[Welcome] += 1;
}
    else {
    productsMap[Welcome]=1;

    }
  }

  void removeProductsFarmCart(Welcome welcome) {
    if(productsMap.containsKey(welcome)&& productsMap[welcome]==1){
      productsMap.removeWhere((key, value) => key == welcome);

    }else{
      productsMap[welcome] -=1;
    }

  }

  void removeOneProduct(Welcome welcome) {
    productsMap.removeWhere((key, value) => key == welcome);

  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: " Clean Products",
      titleStyle: TextStyle(fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      ),middleText: "Are You Sure you need to clear products",
      middleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,

      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: "No",
        cancelTextColor: Colors.white,
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onCancel: (){
        Get.toNamed(Routes.carditem);
      },
      onConfirm: (){
        productsMap.clear();
        Get.back();


      }

    );
  }
get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();
get total=> productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element);
int quantity(){
  if(productsMap.isEmpty){
    return 0;
  }
  return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value+element);
}

}

