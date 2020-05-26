import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class Trailer extends StatefulWidget {
  @override
  _Trailer createState() => _Trailer();
}

class _Trailer extends State<Trailer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text("Trailer", style: TextStyle(color: Colors.white, fontSize: 20,) ,),
        ),
        YoutubePlayer(
          source: "7QUtEmBT_-w",
          //source: "https://www.youtube.com/watch?v=NyTOHJW1PIE",
          quality: YoutubeQuality.HD,
          aspectRatio: 16 / 9,
        ),
      ],
    );
  }
}