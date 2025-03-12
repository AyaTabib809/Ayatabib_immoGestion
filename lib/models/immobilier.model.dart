class Immobilier {
  String id;
  String nom;
  String adresse;
  String type; // "Maison", "Appartement", "Bureau"

  Immobilier({
    required this.id,
    required this.nom,
    required this.adresse,
    required this.type,
  });

  void setId(String newId) {
    id = newId;
  }

  factory Immobilier.fromMap(Map<String, dynamic> map) {
    return Immobilier(
      id: map['id'],
      nom: map['nom'],
      adresse: map['adresse'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'adresse': adresse,
      'type': type,
    };
  }
}
