import 'package:flutter/material.dart';
import "package:assets_audio_player/assets_audio_player.dart";
import 'songinfo.dart';

class SongPage extends StatefulWidget {
  SongPage({Key key, this.songurl}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.network(icon[url.indexOf(widget.songurl)])),
          Text(titles[url.indexOf(widget.songurl)],style: TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(iconSize: 70,icon: Icon(Icons.play_circle_filled), onPressed: ()async{
                try {
                  await assetsAudioPlayer.open(
                      Audio.network(widget.songurl),
                  );
              } catch (t) {
                  print(t);
              }}),
              IconButton(iconSize: 70,icon: Icon(Icons.pause_circle_filled), onPressed: (){
              assetsAudioPlayer.playOrPause();
          }
          )
            ],
          ),
          
        ],
      ),
    );
  }
}