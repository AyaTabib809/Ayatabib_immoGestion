class Maison {
  String id;
  String idImmobilier;
  String numero;
  int nombreDePieces;

  Maison({
    required this.id,
    required this.idImmobilier,
    required this.numero,
    required this.nombreDePieces,
  });

  void setId(String newId) {
    id = newId;
  }

  factory Maison.fromMap(Map<String, dynamic> map) {
    return Maison(
      id: map['id'],
      idImmobilier: map['idImmobilier'],
      numero: map['numero'],
      nombreDePieces: map['nombreDePieces'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idImmobilier': idImmobilier,
      'numero': numero,
      'nombreDePieces': nombreDePieces,
    };
  }
}
