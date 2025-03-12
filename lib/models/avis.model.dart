class Avis {
  String id;
  String idClient;
  String commentaire;
  int note;

  Avis({
    required this.id,
    required this.idClient,
    required this.commentaire,
    required this.note,
  });

  // Méthode fromMap
  factory Avis.fromMap(Map<String, dynamic> map) {
    return Avis(
      id: map['id']?.toString() ?? '',
      idClient: map['idClient']?.toString() ?? '',
      commentaire: map['commentaire']?.toString() ?? '',
      note: (map['note'] is int) ? map['note'] : int.tryParse(map['note'].toString()) ?? 0,
    );
  }

  // Méthode toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idClient': idClient,
      'commentaire': commentaire,
      'note': note,
    };
  }
}
