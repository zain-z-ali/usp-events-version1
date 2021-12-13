import 'package:flutter/material.dart';
import 'package:version1_0/models/gallery_model.dart';

class GalleryDetail extends StatelessWidget {
  final Gallery gallery;

  GalleryDetail({required this.gallery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Event Images"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.teal[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Event Name"),
                        subtitle: Text(gallery.imageName),
                      ),
                      ListTile(
                        title: Text("Description"),
                        subtitle: Text(
                          "URL : ${gallery.imageDescription}"),
                      ), 
                      ListTile(
                        title: Text("Image:"),
                        subtitle: Image.network(gallery.imageLink),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}
