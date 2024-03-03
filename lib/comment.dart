import 'dart:convert';

class Comment {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'postId': postId,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return Comment(
      id: map['id'],
      postId: map['postId'],
      name: map['name'],
      email: map['email'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));
}
