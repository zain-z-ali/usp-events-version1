
class Gallery {
  final int imageID;
  final String imageName;
  final String imageDescription;
  final String imageLink;

  Gallery({
    required this.imageID,
    required this.imageName,
    required this.imageDescription,
    required this.imageLink,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      imageID: json['image_id'] as int,
      imageName: json['name'] as String,
      imageDescription: json['description'] as String,
      imageLink: json['link'] as String,
    );
  }
}