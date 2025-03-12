class Panne {
  String id;
  String idEquipement;
  String description;
   String typePann;
  DateTime dateSignalement;

  Panne({
    required this.id,
    required this.idEquipement,
    required this.description,
    required this.dateSignalement,
    required this.typePann,
  });

  // Mettre à jour l'ID
  void setId(String newId) {
    id = newId;
  }

  // Convertir un Map en Objet
  factory Panne.fromMap(Map<String, dynamic> map) {
    return Panne(
      id: map['id'],
      idEquipement: map['idEquipement'],
      description: map['description'],
      typePann: map['typePann'],
      dateSignalement: DateTime.parse(map['dateSignalement']),
    );
  }

  // Convertir un Objet en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idEquipement': idEquipement,
      'description': description,
      'dateSignalement': dateSignalement.toIso8601String(),
    };
  }
}
