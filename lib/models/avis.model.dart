class Avis {
  String id;
  String idClient;
  String commentaire;
  int note;

  Avis({required this.id, required this.idClient, required this.commentaire, required this.note});

  factory Avis.fromJson(Map<String, dynamic> json) {
    return Avis(
      id: json['id'],
      idClient: json['idClient'],
      commentaire: json['commentaire'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idClient': idClient,
      'commentaire': commentaire,
      'note': note,
    };
  }
}
