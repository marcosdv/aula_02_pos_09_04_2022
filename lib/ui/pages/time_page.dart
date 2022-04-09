import 'package:aula_02_pos/ui/components/Imagem.dart';
import 'package:flutter/material.dart';

class TimePage extends StatelessWidget {
  final Map<String, dynamic> dados;

  const TimePage(this.dados, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dados["Tim_Nome"]),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Imagem(dados["Tim_Bandeira"].toString()
              .replaceAll("~/", "http://controle.mdvsistemas.com.br/")),
        ],
      ),
    );
  }
}