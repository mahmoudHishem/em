

import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/logic/controllers/category%20controller.dart';
import 'package:em/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }

}