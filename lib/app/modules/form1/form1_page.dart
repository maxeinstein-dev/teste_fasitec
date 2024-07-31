import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/form1/form1_controller.dart';

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
            if (controller.currentFormIndex.value > 0) {
              controller.currentFormIndex.value--;
              controller.pageController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            } else {
              Get.back();
            }
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
          color: Colors.black,
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildForm1(controller),
          _buildForm2(controller),
          _buildForm3(controller),
        ],
      ),
    );
  }
}

Widget _buildForm1(Form1Controller controller) {
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
            controller: controller.nameController,
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
            /* Validação para que o CPF tenha 11 caracteres */
            validator: (value) => controller.validateCPF(value!),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailController,
            /* Validação para que o e-mail tenha o símbolo do @, . e algum caracter antes e depois de ambos os símbolos */
            validator: (value) => controller.validateEmail(value!),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                if (controller.formKey1.currentState!.validate()) {
                  controller.currentFormIndex.value++;
                  controller.pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
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

Widget _buildForm2(Form1Controller controller) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Form(
      key: controller.formKey2,
      child: ListView(
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
                  controller.currentFormIndex.value++;
                  controller.pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                }
              },
              child: const Text("Próximo")),
        ],
      ),
    ),
  );
}

Widget _buildForm3(Form1Controller controller) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Form(
      key: controller.formKey3,
      child: ListView(
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
                  final user = controller.getUser();
                  Get.toNamed("/userPage", arguments: user);
                }
              },
              child: const Text("Próximo")),
        ],
      ),
    ),
  );
}
