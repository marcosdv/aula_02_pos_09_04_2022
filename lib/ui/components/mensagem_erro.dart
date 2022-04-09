import 'package:flutter/material.dart';

class MensagemErro extends StatelessWidget {
  final texto;

  const MensagemErro(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 244,),
            Text(texto, style: const TextStyle(fontSize: 28, color: Colors.red),),
          ],
        ),
      ),
    );
  }
}
