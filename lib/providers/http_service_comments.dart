import 'dart:convert';
import 'package:http/http.dart';
import 'package:json_api/models/comment_model.dart';
import '../models/post_model.dart';

class HttpServiceComment {
  final String comments = "https://jsonplaceholder.typicode.com/comments";

  Future<List<Comment>> getPosts() async {
    Response res = await get(Uri.parse(comments));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Comment> comment = body
          .map(
            (dynamic item) => Comment.fromJson(item),
          )
          .toList();

      return comment;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
