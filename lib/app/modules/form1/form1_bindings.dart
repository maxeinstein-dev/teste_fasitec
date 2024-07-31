import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/form1/form1_controller.dart';

class Form1Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Form1Controller>(() => Form1Controller());
  }
}
