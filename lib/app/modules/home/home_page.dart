import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              "Escolha qual formulário preencher: ",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
                onPressed: () => {Get.toNamed('/form1')},
                child: const Text(
                  "Formulário 1",
                  style: TextStyle(fontSize: 25),
                )),
            ElevatedButton(
                onPressed: () => {Get.toNamed('/form2')},
                child: const Text(
                  "Formulário 2",
                  style: TextStyle(fontSize: 25),
                )),
            ElevatedButton(
                onPressed: () => {Get.toNamed('/form3')},
                child: const Text(
                  "Formulário 3",
                  style: TextStyle(fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
