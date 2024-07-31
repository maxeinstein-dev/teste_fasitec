import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/user/user_controller.dart';

class Form3Page extends StatelessWidget {
  const Form3Page({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
          color: Colors.black,
        ),
      ),
      body: Container(),
    );
  }
}
