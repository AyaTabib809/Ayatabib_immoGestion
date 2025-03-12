class Intervention {
  String id;
  String idTechnicien;
  String description;
  DateTime dateIntervention;
  String resultat; // "En attente", "En cours", "Terminée"
String commentaire;
  Intervention({
    required this.id,
    required this.idTechnicien,
    required this.description,
    required this.dateIntervention,
    required this.resultat,
    required this.commentaire,
  });

  // Mettre à jour l'ID
  void setId(String newId) {
    id = newId;
  }

  // Convertir un Map en Objet
  factory Intervention.fromMap(Map<String, dynamic> map) {
    return Intervention(
      id: map['id'],
      idTechnicien: map['idTechnicien'],
      description: map['description'],
      commentaire: map['commentaire'],
      dateIntervention: DateTime.parse(map['dateIntervention']),
      resultat: map['resultat'],
    );
  }

  // Convertir un Objet en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idTechnicien': idTechnicien,
      'description': description,
      'dateIntervention': dateIntervention.toIso8601String(),
      'resultat': resultat,
      'commentaire': commentaire,
    };
  }
}
