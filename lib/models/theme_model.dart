import 'package:flutter/foundation.dart';

class ThemeModel {
  final int themeID;
  final String themeName;
  //final String themeEventID;
  //final String themeOrg;
  //final String themeBio;

  ThemeModel({
    required this.themeID,
    required this.themeName,
    //required this.speakerProfession,
    //required this.speakerOrg,
    //required this.speakerBio,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      themeID: json['theme_id'] as int,
      themeName: json['theme_name'] as String,
      //speakerProfession: json['speaker_profession'] as String,
      //speakerOrg: json['speaker_org'] as String,
      //speakerBio: json['speaker_bio'] as String,
    );
  }
}
