import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/form1/form1_controller.dart';
import 'package:teste_fasitec/app/modules/user/user_page.dart';

class PasswordWidget extends StatelessWidget {
  final Form1Controller controller;
  const PasswordWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: controller.formKey3,
        child: ListView(
          shrinkWrap: true,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Digite sua senha"),
              obscureText: true,
              controller: controller.passwordController,
              validator: (value) => controller.validatePassword(value!),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Repita sua senha"),
              obscureText: true,
              controller: controller.confirmPasswordController,
              validator: (value) => controller.validateConfirmPassword(value!),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.formKey3.currentState!.validate()) {
                    final user = controller.getUser();
                    Get.to(() => const UserPage(), arguments: user);
                  }
                },
                child: const Text("Próximo")),
          ],
        ),
      ),
    );
  }
}
