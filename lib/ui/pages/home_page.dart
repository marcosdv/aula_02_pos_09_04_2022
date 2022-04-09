import 'dart:convert';
import 'package:aula_02_pos/ui/components/Imagem.dart';
import 'package:aula_02_pos/ui/pages/time_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<dynamic>> _getLista() async {
    String link = "http://controle.mdvsistemas.com.br/Esportes/Times/GetTime";
    var response = await http.get(Uri.parse(link));
    return json.decode(response.body);
  }

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
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _getLista(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Text('Erro ao acessar a API (${snapshot.error.toString()})');
                    }
                    else {
                      return _criarListagem(context, snapshot);
                    }
                }
              }
            ),
          ),
        ],
      ),
    );
  }

  Widget _criarListagem(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ClipOval(
                    child: Imagem(snapshot.data[index]["Tim_Bandeira"].toString()
                        .replaceAll("~/", "http://controle.mdvsistemas.com.br/"),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(snapshot.data[index]["Tim_Nome"],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          onTap: () { _abrirItem(snapshot.data[index]); },
        );
      }
    );
  }

  void _abrirItem(Map<String, dynamic> dados) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => TimePage(dados)
    ));
  }
}