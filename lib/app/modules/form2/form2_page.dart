import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/user/user_controller.dart';

class Form2Page extends StatelessWidget {
  const Form2Page({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: userController.formKey,
          child: ListView(
            children: [
              Center(
                  child: Image.asset(
                "assets/images/logo.png",
                width: 300,
                height: 80,
                fit: BoxFit.contain,
              )),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Digite seu nome"),
                controller: userController.nameController,
                validator: (value) => Validation.validate(value, "nome"),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Digite seu sobrenome"),
                controller: userController.lastNameController,
                validator: (value) => Validation.validate(value, "sobrenome"),
              ),
              TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Digite seu CPF"),
                  keyboardType: TextInputType.number,
                  controller: userController.cpfController,
                  /* Validação para que o CPF tenha 11 caracteres */
                  validator: (value) {
                    final emptyValidation = Validation.validate(value, "CPF");
                    if (emptyValidation != null) return emptyValidation;
                    if (value!.length < 11) {
                      return "Por favor, digite um CPF válido com 11 caracteres";
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: const InputDecoration(labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  controller: userController.emailController,
                  /* Validação para que o e-mail tenha o símbolo do @, . e algum caracter antes e depois de ambos os símbolos */
                  validator: (value) {
                    final emptyValidation = Validation.validate(value, "email");
                    if (emptyValidation != null) return emptyValidation;
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                      return "Por favor, digite um e-mail válido";
                    }
                    return null;
                  }),
              TextFormField(
                decoration: const InputDecoration(labelText: "Digite seu CEP"),
                keyboardType: TextInputType.number,
                controller: userController.cepController,
                validator: (value) => Validation.validate(value, "CEP"),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: "Endereço"),
                    controller: userController.addressController,
                    validator: (value) =>
                        Validation.validate(value, "endereço"),
                  )),
                  const SizedBox(width: 15),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: "Número"),
                    keyboardType: TextInputType.number,
                    controller: userController.numberController,
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: "Cidade"),
                    controller: userController.cityController,
                    validator: (value) => Validation.validate(value, "cidade"),
                  )),
                  const SizedBox(width: 15),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: "Bairro"),
                    controller: userController.neighborhoodController,
                    validator: (value) => Validation.validate(value, "bairro"),
                  )),
                ],
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Digite sua senha"),
                obscureText: true,
                controller: userController.passwordController,
                validator: (value) => Validation.validate(value, "senha"),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Repita sua senha"),
                obscureText: true,
                controller: userController.confirmPasswordController,
                validator: (value) {
                  final emptyValidation = Validation.validate(value, "senha");
                  if (emptyValidation != null ||
                      value != userController.passwordController.text) {
                    return "As senhas não são iguais. Por favor, redigite sua senha";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (userController.formKey.currentState?.validate() ??
                        false) {
                      final user = userController.getUser();
                      if (user != null) {
                        Get.toNamed("/user", arguments: user);
                      }
                    }
                  },
                  child: const Text("Próximo")),
              const SizedBox(
                height: 60,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 50,
                  ),
                  SizedBox(width: 30),
                  Icon(
                    Icons.archive,
                    size: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
