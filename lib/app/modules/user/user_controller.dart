import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/data/model/user.dart';
import 'package:teste_fasitec/app/modules/user/user_page.dart';

class UserController extends GetxController {
  /* Controllers de cada campo para que seja atualizado e enviado */
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final cepController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final cityController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /* Controller da key do form */
  final formKey = GlobalKey<FormState>();

  User? getUser() {
    if (formKey.currentState?.validate() ?? false) {
      return User(
        name: nameController.text,
        lastName: lastNameController.text,
        cpf: cpfController.text,
        email: emailController.text,
        cep: cepController.text,
        address: addressController.text,
        number: numberController.text,
        city: cityController.text,
        neighborhood: neighborhoodController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
    }

    return null;
  }

  var currentFormIndex = 0.obs;
  void nextForm() {
    if (currentFormIndex < 2) {
      currentFormIndex.value++;
    } else {
      final user = getUser();
      Get.to(() => const UserPage(), arguments: user);
    }
  }

  String? validate(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      if (fieldName == "cidade" || fieldName == "senha") {
        return "Por favor, digite a sua $fieldName";
      } else {
        return "Por favor, digite o seu $fieldName";
      }
    }
    return null;
  }
}

