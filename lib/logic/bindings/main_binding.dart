
import 'package:em/logic/controllers/main_controllers.dart';
import 'package:em/logic/controllers/paymentcontroller.dart';
import 'package:em/logic/controllers/settingscontroller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PayMentController());
    // TODO: implement dependencies
  }

}