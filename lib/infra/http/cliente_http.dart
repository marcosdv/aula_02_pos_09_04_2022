import 'dart:convert';
import 'package:http/http.dart' as http;

class ClienteHttp {
  Future<List<dynamic>> getJson(String link) async {
    var response = await http.get(Uri.parse(link));
    return json.decode(response.body);
  }
}