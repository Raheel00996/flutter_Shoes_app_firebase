import 'dart:convert';

fromjson1(e) => User.fromjson(jsonDecode(e));

class User {
  final int? id;
  final String? name;
  final bool? status;

  User({
    this.id,
    this.name,
    this.status,
  });

  factory User.fromjson(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name'], status: json['status']);
}
