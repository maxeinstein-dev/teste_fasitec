import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/form1/form1_controller.dart';

class PasswordOverlay extends StatelessWidget {
  final Form1Controller controller;
  const PasswordOverlay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: Get.height * 0.6,
        child: Form(
          key: controller.formKey3,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Digite sua senha"),
                obscureText: true,
                controller: controller.passwordController,
                validator: (value) => controller.validatePassword(value!),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Repita sua senha"),
                obscureText: true,
                controller: controller.confirmPasswordController,
                validator: (value) =>
                    controller.validateConfirmPassword(value!),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (controller.formKey3.currentState!.validate()) {
                      final user = controller.getUser();
                      Get.toNamed("/userPage", arguments: user);
                      controller.removeOverlay();
                    }
                  },
                  child: const Text("Próximo")),
            ],
          ),
        ),
      ),
    );
  }
}
