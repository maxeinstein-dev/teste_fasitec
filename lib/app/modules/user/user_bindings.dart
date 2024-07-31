import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/user/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
