class Usuario {
  late int id;
  late String name;
  late String ape;
  late int cell;
  late String fec;

  Usuario({
    required this.cell,
    required this.fec,
    required this.id,
    required this.name,
    required this.ape,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'ape': ape, 'cell': cell, 'fec': fec};
  }

  @override
  String toString() {
    return 'Usuario{id: $id, name: $name, ape: $ape, cell: $cell, fec $fec }';
  }
}
