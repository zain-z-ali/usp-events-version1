import 'package:flutter/material.dart';
import '../services/httpService_speaker.dart';
import 'package:version1_0/models/speaker_model.dart';
import 'package:version1_0/view/speaker_detail.dart';
import 'package:version1_0/view/navBar.dart';

class PostsPage extends StatelessWidget {
  final HttpService_speaker httpService = HttpService_speaker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Speakers"),
      ),
      body: FutureBuilder(
        future: httpService.getSpeakers(),
        builder: (BuildContext context, AsyncSnapshot<List<Speaker>> snapshot) {
          if (snapshot.hasData) {
            List<Speaker>? speakers = snapshot.data;
            return ListView(
              children: speakers!
                  .map(
                    (Speaker speaker) => ListTile(
                      leading: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            //'assets\images\generic_user.png',
                            'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg',
                            width: 90,
                            height: 90,
                            fit: BoxFit
                                .cover, //makes the image cover the whole circle
                          ),
                        ),
                      ),
                      title: Text(speaker.speakerName),
                      subtitle: Text(speaker.speakerProfession),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SpeakerDetail(
                            speaker: speaker,
                          ),
                        ),
                      ),
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
