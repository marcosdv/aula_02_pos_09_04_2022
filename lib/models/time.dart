import 'package:aula_02_pos/constantes.dart';
import 'package:aula_02_pos/extensions/extensions.dart';

class Time {
  int codigo;
  String nome;
  String logo;

  Time({required this.codigo,
    required this.nome, required this.logo});

  factory Time.fromMap(Map<String, dynamic> mapa) {
    return Time(
      codigo: mapa['Tim_Codigo'].toString().toInt(),
      nome: mapa['Tim_Nome'] ?? '',
      logo: (mapa['Tim_Bandeira'] ?? '').toString()
          .replaceAll('~/', linkApi)
    );
  }
}