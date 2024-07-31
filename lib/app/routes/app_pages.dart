import 'package:get/get.dart';

import 'package:teste_fasitec/app/modules/Home/Home_page.dart';
import 'package:teste_fasitec/app/modules/form1/form1_bindings.dart';
import 'package:teste_fasitec/app/modules/form1/form1_page.dart';
import 'package:teste_fasitec/app/modules/form2/form2_bindings.dart';
import 'package:teste_fasitec/app/modules/form2/form2_page.dart';
import 'package:teste_fasitec/app/modules/form3/form3_bindings.dart';
import 'package:teste_fasitec/app/modules/form3/form3_page.dart';
import 'package:teste_fasitec/app/modules/home/home_bindings.dart';
import 'package:teste_fasitec/app/modules/user/user_bindings.dart';
import 'package:teste_fasitec/app/modules/user/user_page.dart';
import 'package:teste_fasitec/app/routes/app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.form1,
      page: () => const Form1Page(),
      binding: Form1Binding(),
    ),
    GetPage(
      name: Routes.form2,
      page: () => const Form2Page(),
      binding: Form2Binding(),
    ),
    GetPage(
      name: Routes.form3,
      page: () => const Form3Page(),
      binding: Form3Binding(),
    ),
    GetPage(
      name: Routes.user,
      page: () => const UserPage(),
      binding: UserBinding(),
    ),
  ];
}
