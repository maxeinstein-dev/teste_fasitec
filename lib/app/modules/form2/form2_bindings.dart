import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/form2/form2_controller.dart';

class Form2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Form2Controller>(() => Form2Controller());
  }
}
