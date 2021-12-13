import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class Podcast extends StatefulWidget {
  @override
  _PodcastState createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Podcast"),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/podcast.jpg"),),

          slider(),

          InkWell(
            onTap: (){
              getAudio();
            },
            child: Icon(playing == false 
              ? Icons.play_circle_outlined
              : Icons.pause_circle_outlined,
              size: 100,
              color: Colors.blue,
            ),
          )

          ],
        ),
      ),
    );
  }

  Widget slider(){
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value){
        setState(() {
          audioPlayer.seek(Duration(seconds: value.toInt()));
        });
      },
    );
  }

void getAudio()async{
  var url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  
  if(playing){
  var res = await audioPlayer.pause();
  if(res == 1){
    setState(() {
      playing = false;
      });
    }
  }

  else{

  var res = await audioPlayer.play(url, isLocal: true);
  if (res == 1){
    setState(() {
      playing = true;
       });
     } 
    } 

  audioPlayer.onDurationChanged.listen((Duration dd){
  setState(() {
    duration = dd;
      });
    });
  audioPlayer.onAudioPositionChanged.listen((Duration dd) {
    setState(() {
      position = dd;
        });
      });
  } 
}
