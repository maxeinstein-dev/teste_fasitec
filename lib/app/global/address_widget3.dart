import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/form3/form3_controller.dart';
import 'package:teste_fasitec/app/modules/user/user_page.dart';

class AddressWidget3 extends StatelessWidget {
  final Form3Controller controller;
  const AddressWidget3({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: controller.formKey2,
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: 300,
              height: 80,
              fit: BoxFit.contain,
            )),
            const SizedBox(
              height: 40,
            ),
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
