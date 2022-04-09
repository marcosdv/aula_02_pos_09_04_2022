import 'package:aula_02_pos/ui/components/components.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          Imagem('images/imagem.jpg'),
        ],
      ),
    );
  }
}
