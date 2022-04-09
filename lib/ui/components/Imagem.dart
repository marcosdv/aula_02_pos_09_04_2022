import 'package:flutter/material.dart';

class Imagem extends StatelessWidget {
  final String linkImagem;
  final double? height;
  final double? width;

  const Imagem(this.linkImagem, {this.height, this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(linkImagem,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
