class Entry {
  final int? id;
  final String name;
  final String description;

  Entry({this.id, required this.name, required this.description});

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
