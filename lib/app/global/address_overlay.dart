import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/global/overlay_global.dart';
import 'package:teste_fasitec/app/global/password_overlay.dart';
import 'package:teste_fasitec/app/modules/form1/form1_controller.dart';

class AddressOverlay extends StatelessWidget {
  final Form1Controller controller;
  const AddressOverlay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: Get.height * 0.6,
        child: Form(
          key: controller.formKey2,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Digite seu CEP"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: controller.cepController,
                validator: (value) => controller.validate(value, "CEP"),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: "Endereço"),
                    controller: controller.addressController,
                    validator: (value) =>
                        controller.validate(value, "endereço"),
                  )),
                  const SizedBox(width: 15),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: "Número"),
                    keyboardType: TextInputType.number,
                    controller: controller.numberController,
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: "Cidade"),
                    controller: controller.cityController,
                    validator: (value) => controller.validate(value, "cidade"),
                  )),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Bairro"),
                      controller: controller.neighborhoodController,
                      validator: (value) =>
                          controller.validate(value, "bairro"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    if (controller.formKey2.currentState!.validate()) {
                      showOverlay(
                          context, PasswordOverlay(controller: controller));
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
