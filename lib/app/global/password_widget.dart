import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/global/address_widget.dart';
import 'package:teste_fasitec/app/modules/form3/form3_controller.dart';

class PasswordWidget extends StatelessWidget {
  final Form3Controller controller;
  const PasswordWidget({super.key, required this.controller});

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
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (controller.formKey3.currentState!.validate()) {
                      Get.bottomSheet(
                        isScrollControlled: true,
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: Get.height * 0.8,
                                width: Get.width,
                                child: AddressWidget(controller: controller),
                              )
                            ],
                          ),
                        ),
                      );
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
