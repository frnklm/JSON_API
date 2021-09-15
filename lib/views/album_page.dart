import 'package:flutter/material.dart';
import 'package:json_api/models/album_model.dart';
import '../providers/http_service_albums.dart';
import '../models/post_model.dart';

class AlbumPage extends StatelessWidget {
  final HttpServiceAlbums httpServiceAlbums = HttpServiceAlbums();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums"),
      ),
      body: FutureBuilder(
        future: httpServiceAlbums.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.hasData) {
            List<Album> album = snapshot.data!;
            return ListView(
              children: album
                  .map(
                    (Album album) => ListTile(
                      title: Text(album.title),
                      subtitle: Text("${album.userId}"),
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
