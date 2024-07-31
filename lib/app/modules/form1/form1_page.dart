import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/modules/user/user_controller.dart';

class Form1Page extends StatelessWidget {
  const Form1Page({super.key});

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
        padding: const EdgeInsets.all(30),
        child: Form(
          key: userController.formKey,
          child: ListView(
            children: [
              Center(
                  child: Image.asset(
                "assets/images/logo.png",
                width: 3200,
                height: 80,
                fit: BoxFit.contain,
              )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 50),
                child: Text("Cadastre seus dados"),
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
                  decoration: const InputDecoration(labelText: "Email"),
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
              const SizedBox(height: 50),
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
      ),
    );
  }
}
