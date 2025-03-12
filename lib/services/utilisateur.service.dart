import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/utilisateur.model.dart';

class UtilisateurService {
  final String baseUrl = "https://api.example.com/utilisateurs";

  /// Récupérer tous les utilisateurs
  Future<List<Utilisateur>> getUtilisateurs() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Utilisateur.fromMap(json)).toList();
    } else {
      throw Exception("Erreur lors du chargement des utilisateurs");
    }
  }

  /// Authentifier un utilisateur (Connexion)
  Future<Utilisateur> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'email': email,
        'motDepass': password,
      }),
    );

    if (response.statusCode == 200) {
      return Utilisateur.fromMap(json.decode(response.body));
    } else {
      throw Exception("Email ou mot de passe incorrect");
    }
  }
}
