import 'package:flutter/foundation.dart';

class Speaker {
  final int speakerID;
  final String speakerName;
  final String speakerProfession;
  final String speakerOrg;
  final String speakerBio;

  Speaker({
    required this.speakerID,
    required this.speakerName,
    required this.speakerProfession,
    required this.speakerOrg,
    required this.speakerBio,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) {
    return Speaker(
      speakerID: json['id'] as int,
      speakerName: json['speaker_name'] as String,
      speakerProfession: json['speaker_profession'] as String,
      speakerOrg: json['speaker_org'] as String,
      speakerBio: json['speaker_bio'] as String,
    );
  }
}
