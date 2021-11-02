
import 'dart:typed_data';

class Gallery {
  final int imageID;
  final String imageName;
  final Uint8List image;

  Gallery({
    required this.imageID,
    required this.imageName,
    required this.image,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      imageID: json['image_id'] as int,
      imageName: json['name'] as String,
      image: json['image'] as Uint8List,
    );
  }
}