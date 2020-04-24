import 'dart:convert';
import 'package:beer_app/models/cerveja.model.dart';
import 'package:http/http.dart' as http;

class CervejaRepository {
  
    Future<List<Cerveja>> parseCervejas() async {
    final response = await http.get('https://json-server-beers.azurewebsites.net/cervejas');

    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Cerveja>((json) => Cerveja.fromJson(json)).toList();
  }
}
