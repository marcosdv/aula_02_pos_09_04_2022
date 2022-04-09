import 'package:aula_02_pos/models/models.dart';
import 'package:aula_02_pos/ui/components/imagem.dart';
import 'package:flutter/material.dart';

class TimePage extends StatelessWidget {
  final Time time;

  const TimePage(this.time, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(time.nome),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Imagem(time.logo),
        ],
      ),
    );
  }
}