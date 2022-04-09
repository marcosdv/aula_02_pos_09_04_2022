import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Imagem extends StatelessWidget {
  final String linkImagem;
  final double? height;
  final double? width;
  final bool redonda;

  const Imagem(this.linkImagem, {this.height, this.width, this.redonda = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return redonda ? ClipOval(child: _getImagem()) : _getImagem();
  }

  Widget _getImagem() {
    if (linkImagem.contains('http:') || linkImagem.contains('https:')) {
      return FadeInImage.memoryNetwork(
        image: linkImagem,
        placeholder: kTransparentImage,
        height: height,
        width: width,
        fit: BoxFit.contain,
      );
    }
    else {
      return Image.asset(
        linkImagem,
        height: height,
        width: width,
        fit: BoxFit.contain,
      );
    }
  }
}
