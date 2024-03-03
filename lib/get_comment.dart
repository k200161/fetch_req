import 'package:http/http.dart' as http;

import 'comment.dart';

Future<Comment> getComment(int id) async {
  final url = 'https://jsonplaceholder.typicode.com/comments/$id';
  final res = await http.get(Uri.parse(url));
  return Comment.fromJson(res.body);
}
