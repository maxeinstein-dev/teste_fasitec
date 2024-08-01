import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/global/address_overlay.dart';
import 'package:teste_fasitec/app/global/overlay_global.dart';
import 'package:teste_fasitec/app/modules/user/user_page.dart';
import 'form1_controller.dart';

class Form1Page extends GetView<Form1Controller> {
  const Form1Page({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildForm1(context),
        ],
      ),
    );
  }

  /* void _showOverlay(BuildContext context, Widget formWidget) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100.0, // Ajuste a posição conforme necessário
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: formWidget,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    _currentOverlayEntry = overlayEntry;
  } */

  Widget _buildForm1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: controller.formKey1,
        child: ListView(
          children: [
            Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: 320,
              height: 80,
              fit: BoxFit.contain,
            )),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 50),
              child: Text("Cadastre seus dados"),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Digite seu nome"),
              validator: (value) => controller.validate(value, "nome"),
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: "Digite seu sobrenome"),
              controller: controller.lastNameController,
              validator: (value) => controller.validate(value, "sobrenome"),
            ),
            TextFormField(
                decoration: const InputDecoration(labelText: "Digite seu CPF"),
                keyboardType: TextInputType.number,
                controller: controller.cpfController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) => controller.validateCPF(value!)),
            TextFormField(
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: (value) => controller.validateEmail(value!)),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  if (controller.formKey1.currentState!.validate()) {
                    /* _showOverlay(context, _buildForm2(context)); */
                    showOverlay(
                        context, AddressOverlay(controller: controller));
                  }
                },
                child: const Text("Próximo")),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save,
                  size: 50,
                ),
                SizedBox(width: 30),
                Icon(
                  Icons.cancel,
                  size: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildForm2(BuildContext context) {
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
                  /* if (controller.formKey2.currentState!.validate()) {
                    _currentOverlayEntry?.remove();

                    _showOverlay(context, _buildForm3(context));
                  } */
                },
                child: const Text("Próximo")),
          ],
        ),
      ),
    );
  }

  Widget _buildForm3(BuildContext context) {
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
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.formKey3.currentState!.validate()) {
                    //_currentOverlayEntry?.remove();

                    final user = controller.getUser();
                    Get.to(() => const UserPage(), arguments: user);
                  }
                },
                child: const Text("Concluir")),
          ],
        ),
      ),
    );
  }
}
