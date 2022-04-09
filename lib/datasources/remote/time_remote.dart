import 'package:aula_02_pos/constantes.dart';
import 'package:aula_02_pos/infra/http/http.dart';
import 'package:aula_02_pos/models/models.dart';

class TimeRemote {
  final _link = '${linkApiEsportes}Times/GetTime';
  final _clienteHttp = ClienteHttp();

  Future<List<Time>> get() async {
    final lista = await _clienteHttp.getJson(_link);
    return lista.map((e) => Time.fromMap(e)).toList();
  }
}