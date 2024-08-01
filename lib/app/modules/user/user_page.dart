import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_fasitec/app/data/model/user.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    /* Recebe todos os argumentos passados pela página de formulário */
    final User user = Get.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados do usuário salvo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Text(
              "Usuário cadastrado com sucesso",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Nome: ${user.name}",
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
            Text(
              "Sobrenome: ${user.lastName}",
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
            Text(
              "CPF: ${user.cpf}",
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
            Text(
              "Email: ${user.email}",
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
            Offstage(
              offstage: user.cep.isEmpty,
              child: Text(
                "CEP: ${user.cep}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Offstage(
                offstage: user.address.isEmpty,
                child: Text(
                  "Endereço completo: ${user.address}, ${user.number.isNotEmpty ? user.number : "S/N"}. \nBairro: ${user.neighborhood}, ${user.city}",
                  style: const TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
