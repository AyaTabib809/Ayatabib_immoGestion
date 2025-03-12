import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/paiements.model.dart';

class PaiementService {
  final String baseUrl = "https://api.example.com/paiements";

  // Récupérer la liste des paiements
  Future<List<Paiement>> getPaiements() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Paiement.fromMap(json)).toList();
    } else {
      throw Exception("Erreur lors du chargement des paiements");
    }
  }

  // Envoyer un paiement
  Future<void> createPaiement(Paiement paiement) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(paiement.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception("Erreur lors de la création du paiement");
    }
  }
}
