import 'package:aula_02_pos/models/models.dart';
import 'package:aula_02_pos/ui/components/components.dart';
import 'package:aula_02_pos/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class ListaTime extends StatelessWidget {
  final List<Time> lista;

  const ListaTime(this.lista, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Imagem(
                        lista[index].logo,
                        height: 80,
                        width: 80,
                        redonda: true
                    ),
                  ),
                  Expanded(
                    child: Text(lista[index].nome,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            onTap: () { _abrirItem(context, lista[index]); },
          );
        }
    );
  }

  void _abrirItem(BuildContext context, Time time) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => TimePage(time)
    ));
  }
}