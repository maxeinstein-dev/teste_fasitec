import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/global/password_widget.dart';
import 'package:teste_fasitec/app/modules/form1/form1_controller.dart';

class AddressWidget extends StatelessWidget {
  final Form1Controller controller;
  const AddressWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
                  validator: (value) => controller.validate(value, "endereço"),
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
                    validator: (value) => controller.validate(value, "bairro"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  if (controller.formKey2.currentState!.validate()) {
                    Get.bottomSheet(
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: Get.height * 0.7,
                              width: Get.width,
                              child: PasswordWidget(controller: controller),
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
    );
  }
}
