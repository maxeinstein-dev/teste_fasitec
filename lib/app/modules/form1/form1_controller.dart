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

  /* Valida os campos */
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

  /* Monta usuário */
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
