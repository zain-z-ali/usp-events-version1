import 'package:flutter/material.dart';
import 'package:version1_0/view/gallery_detail.dart';
import 'package:version1_0/models/gallery_model.dart';
import '../services/httpService_gallery.dart';

class GalleryPage extends StatelessWidget {
  final HttpService_gallery httpService = HttpService_gallery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Feed"),
        automaticallyImplyLeading: false, // removes back button
      ),
      body: FutureBuilder(
        future: httpService.getGallery(),
        builder: (BuildContext context, AsyncSnapshot<List<Gallery>> snapshot) {
          if (snapshot.hasData) {
            List<Gallery>? gallery = snapshot.data;
            return ListView(
              children: gallery!
                  .map(
                    (Gallery gallery) => Card(
                        color: Colors.lightBlue[50],
                        child: ListTile(
                          title: Text(gallery.imageName),
                          subtitle: Text(
                              '${gallery.imageDescription}'),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GalleryDetail(
                                gallery: gallery,
                              ),
                            ),
                          ),
                        )),
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
