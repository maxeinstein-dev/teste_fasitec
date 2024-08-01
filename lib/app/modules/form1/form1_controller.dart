import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/data/model/user.dart';
import 'package:teste_fasitec/app/modules/user/user_page.dart';

class Form1Controller extends GetxController {
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
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  Rx<OverlayEntry?> overlayEntry = Rx<OverlayEntry?>(null);
  void setCurrentOverlay(OverlayEntry currentOverlayEntry) {
    overlayEntry.value = currentOverlayEntry;
  }

  void removeOverlay() {
    overlayEntry.value!.remove();
  }

  final PageController pageController = PageController();
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

  String? validateCPF(String value) {
    if (value.length < 11) {
      return "Por favor, digite um CPF válido com 11 caracteres";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (value.length < 4) {
      return "A senha deve possuir pelo menos 4 caracteres";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Confirme sua senha';
    }

    if (value != passwordController.text) {
      return "As senhas não coincidem";
    }
    return null;
  }

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
}
