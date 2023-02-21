import 'dart:collection';

class Book {
  final int id;
  final String? type;
  final String? name;
  final bool available;

  Book({required this.id, this.type, this.name, this.available = false});

  Book.fromJson(LinkedHashMap<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        name = json['name'],
        available = json['available'];

  // Map<String, dynamic> toJson() =>
  //     {'id': name, 'type': type, 'name': name, 'available': available};
}
