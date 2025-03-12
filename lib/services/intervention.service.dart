import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/intervention.model.dart';

class InterventionService {
  final String baseUrl = "https://api.example.com/interventions";

  Future<List<Intervention>> getInterventions() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Intervention.fromMap(json)).toList();
    } else {
      throw Exception("Erreur lors du chargement des interventions");
    }
  }

  Future<void> addIntervention(Intervention intervention) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(intervention.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception("Erreur lors de l'ajout de l'intervention");
    }
  }
}
