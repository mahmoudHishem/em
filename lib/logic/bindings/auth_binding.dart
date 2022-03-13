
import 'package:em/logic/controllers/auth_controles.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthControlles());
    // TODO: implement dependencies
  }

}