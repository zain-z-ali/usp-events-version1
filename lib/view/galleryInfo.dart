import 'package:flutter/material.dart';
import 'package:version1_0/view/Gallery.dart';

class GalleryInfo extends StatelessWidget {
  const GalleryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GalleryPage(),
    );
  }
}
