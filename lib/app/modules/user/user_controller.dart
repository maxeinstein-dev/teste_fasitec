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

  /* Chaves para cada formulário */
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  final PageController pageController = PageController();

  User? getUser() {
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

/* Método para avançar para o próximo formulário sendo efetuada a validação */
  var currentFormIndex = 0.obs;
  void nextForm() {
    if (currentFormIndex.value < 2) {
      currentFormIndex.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else if (currentFormIndex.value == 2 &&
        formKey3.currentState!.validate()) {
      final user = getUser();
      Get.to(() => const UserPage(), arguments: user);
    }
  }

/* Valida se os campos estão vazios ou nulos para retornar mensagem de erro */
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
