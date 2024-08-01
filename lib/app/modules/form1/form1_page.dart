import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/global/addres_widget.dart';
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
      body: Padding(
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
                  decoration:
                      const InputDecoration(labelText: "Digite seu CPF"),
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
                      Get.bottomSheet(
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: Get.height * 0.7,
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
