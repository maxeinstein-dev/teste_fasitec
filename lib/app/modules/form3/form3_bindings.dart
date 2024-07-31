import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/form3/form3_controller.dart';

class Form3Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Form3Controller>(() => Form3Controller());
  }
}
