class Rapport {
  String id;
  String idTechnicien;
  String idIntervention;
  String description;
  DateTime dateRapport;

  Rapport({
    required this.id,
    required this.idTechnicien,
    required this.idIntervention,
    required this.description,
    required this.dateRapport,
  });

  void setId(String newId) {
    id = newId;
  }

  factory Rapport.fromMap(Map<String, dynamic> map) {
    return Rapport(
      id: map['id'],
      idTechnicien: map['idTechnicien'],
      idIntervention: map['idIntervention'],
      description: map['description'],
      dateRapport: DateTime.parse(map['dateRapport']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idTechnicien': idTechnicien,
      'idIntervention': idIntervention,
      'description': description,
      'dateRapport': dateRapport.toIso8601String(),
    };
  }
}
