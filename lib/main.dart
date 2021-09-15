import 'package:flutter/material.dart';
import 'package:json_api/utils/app_routes.dart';
import 'views/post_page.dart';
import 'package:json_api/views/comment_page.dart';
import 'package:json_api/views/album_page.dart';
import 'providers/http_service_albums.dart';
import 'providers/http_service_comments.dart';
import 'providers/http_service_posts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'API JSON', home: AlbumPage());
  }
}
