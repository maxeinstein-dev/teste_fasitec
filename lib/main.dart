import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/core/theme/app_theme.dart';
import 'package:teste_fasitec/app/routes/app_pages.dart';
import 'package:teste_fasitec/app/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Tela Principal",
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    ),
  );
}
