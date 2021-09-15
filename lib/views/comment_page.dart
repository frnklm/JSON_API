import 'package:flutter/material.dart';
import 'package:json_api/models/comment_model.dart';
import 'package:json_api/providers/http_service_comments.dart';

class CommentPage extends StatelessWidget {
  final HttpServiceComment httpServiceComment = HttpServiceComment();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: FutureBuilder(
        future: httpServiceComment.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.hasData) {
            List<Comment> comment = snapshot.data!;
            return ListView(
              children: comment
                  .map(
                    (Comment comment) => ListTile(
                      title: Text(comment.name),
                      subtitle: Text("${comment.email}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
