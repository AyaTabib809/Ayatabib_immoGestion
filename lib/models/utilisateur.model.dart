class Utilisateur {
  String id;
  String nom;
  String prenom;
  String email;
  String motDepass;
  String role; // "client", "technicien", "administrateur"
  String statut; // "valider" "rejeter", "en attente"

  Utilisateur({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.motDepass,
    required this.role,
    required this.statut,
  });

  // Méthode fromMap
  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      id: map['id']?.toString() ?? '',
      nom: map['nom']?.toString() ?? '',
      prenom: map['prenom']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      motDepass: map['motDepass']?.toString() ?? '',
      role: map['role']?.toString() ?? '',
      statut: map['statut']?.toString() ?? '',
    );
  }

  // Méthode toMap
  Map<String, dynamic> toMap({bool includePassword = false}) {
    final data = {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'role': role,
      'statut': statut,
    };

    // Inclure le mot de passe uniquement si demandé
    if (includePassword) {
      data['motDepass'] = motDepass;
    }

    return data;
  }
}
