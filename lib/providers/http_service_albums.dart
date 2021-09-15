import 'dart:convert';
import 'package:http/http.dart';
import 'package:json_api/models/album_model.dart';

class HttpServiceAlbums {
  final String albums = "https://jsonplaceholder.typicode.com/albums";

  Future<List<Album>> getPosts() async {
    Response res = await get(Uri.parse(albums));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Album> album = body
          .map(
            (dynamic item) => Album.fromJson(item),
          )
          .toList();

      return album;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
