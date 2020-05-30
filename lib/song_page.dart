import 'package:flutter/material.dart';
import "package:assets_audio_player/assets_audio_player.dart";

class SongPage extends StatefulWidget {
  SongPage({Key key, this.title, this.songurl}) : super(key: key);

  final String title;
  final String songurl;
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  
  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
        Navigator.pop(context);
      })),
      body: Column(
        children: <Widget>[
          // Text(widget.title,style: TextStyle(fontSize: 20),),
          Text(widget.songurl),
          IconButton(icon: Icon(Icons.play_circle_filled), onPressed: ()async{
            try {
              await assetsAudioPlayer.open(
                  Audio.network(widget.songurl),
              );
          } catch (t) {
              print(t);
          }}),
          IconButton(icon: Icon(Icons.pause_circle_filled), onPressed: (){
              assetsAudioPlayer.playOrPause();
          }
          )
        ],
      ),
    );
  }
}