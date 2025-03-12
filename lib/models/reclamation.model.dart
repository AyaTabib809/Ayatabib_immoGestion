class Reclamation {
  String id;
  String idUtlisateur;
  String sujet;
  String description;
  DateTime dateReclamation;
  String statut; // "En attente", "Traité", "Refusé"

  Reclamation({
    required this.id,
    required this.idUtlisateur,
    required this.sujet,
    required this.description,
    required this.dateReclamation,
    required this.statut,
  });

  void setId(String newId) {
    id = newId;
  }

  factory Reclamation.fromMap(Map<String, dynamic> map) {
    return Reclamation(
      id: map['id'],
      idUtlisateur: map['idUtlisateur'],
      sujet: map['sujet'],
      description: map['description'],
      dateReclamation: DateTime.parse(map['dateReclamation']),
      statut: map['statut'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idClient': idUtlisateur,
      'sujet': sujet,
      'description': description,
      'dateReclamation': dateReclamation.toIso8601String(),
      'statut': statut,
    };
  }
}
