
import 'package:em/logic/controllers/main_controllers.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    // TODO: implement dependencies
  }

}