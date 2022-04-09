import 'package:aula_02_pos/datasources/datasources.dart';
import 'package:aula_02_pos/models/models.dart';
import 'package:aula_02_pos/ui/components/components.dart';
import 'package:aula_02_pos/ui/pages/home_page/widgets/lista_time.dart';
import 'package:aula_02_pos/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _abrirSobre() => Navigator.push(context,
      MaterialPageRoute(builder: (context) => const SobrePage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.sports_soccer),
            Text('Times de Futebol - API'),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, size: 32,),
            onPressed: _abrirSobre
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: TimeRemote().get(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CirculoEspera();
                  default:
                    if (snapshot.hasError) {
                      return GestureDetector(
                        child: MensagemErro('Erro ao acessar a API (${snapshot.error.toString()})'),
                        onTap: () { setState(() { }); },
                      );
                    }
                    else {
                      return ListaTime(snapshot.data as List<Time>);
                    }
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}