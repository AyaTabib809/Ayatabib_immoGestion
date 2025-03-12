class Equipement {
  String id;
  String idPiece;
  String libelle;
  String quantite;
  String nomE;

  Equipement({
    required this.id,
    required this.idPiece,
    required this.libelle,
    required this.quantite,
    required this.nomE,
  });

  void setId(String newId) {
    id = newId;
  }

  factory Equipement.fromMap(Map<String, dynamic> map) {
    return Equipement(
      id: map['id'],
      idPiece: map['idPiece'],
      libelle: map['libelle'],
      quantite: map['quantite'],
      nomE: map['nomE'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPiece': idPiece,
      'libelle': libelle,
      'quantite': quantite,
      'nomE': nomE,
    };
  }
}
