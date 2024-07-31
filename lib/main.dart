import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/Home/Home_page.dart';
import 'package:teste_fasitec/app/modules/form1/form1_page.dart';
import 'package:teste_fasitec/app/modules/form2/form2_page2.dart';
import 'package:teste_fasitec/app/modules/form3/form3_page.dart';
import 'package:teste_fasitec/app/modules/user/user_page.dart';
import 'package:teste_fasitec/app/core/theme/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
        title: "Tela Principal",
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const HomePage()),
          GetPage(name: '/form1', page: () => const Form1Page()),
          GetPage(name: '/form2', page: () => const Form2Page()),
          GetPage(name: '/form3', page: () => const Form3Page()),
          GetPage(name: '/user', page: () => const UserPage()),
        ]),
  );
}
