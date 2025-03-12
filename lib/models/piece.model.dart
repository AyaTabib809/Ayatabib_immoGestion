class Piece {
  String id;
  String idMaison;
  String nom;

  Piece({
    required this.id,
    required this.idMaison,
    required this.nom,
  });

  void setId(String newId) {
    id = newId;
  }

  factory Piece.fromMap(Map<String, dynamic> map) {
    return Piece(
      id: map['id'],
      idMaison: map['idMaison'],
      nom: map['nom'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idMaison': idMaison,
      'nom': nom,
    };
  }
}
