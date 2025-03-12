class Paiement {
  String id;
  String idClient;
  double montant;
  DateTime datePaiement;
  String modePaiement; // "Carte", "Espèces", "Virement"

  Paiement({
    required this.id,
    required this.idClient,
    required this.montant,
    required this.datePaiement,
    required this.modePaiement,
  });

  void setId(String newId) {
    id = newId;
  }

  factory Paiement.fromMap(Map<String, dynamic> map) {
    return Paiement(
      id: map['id'],
      idClient: map['idClient'],
      montant: map['montant'].toDouble(),
      datePaiement: DateTime.parse(map['datePaiement']),
      modePaiement: map['modePaiement'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idClient': idClient,
      'montant': montant,
      'datePaiement': datePaiement.toIso8601String(),
      'modePaiement': modePaiement,
    };
  }
}
