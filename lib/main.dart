import 'package:flutter/material.dart';
import 'package:musicx/reusable_card.dart';
import 'package:musicx/songinfo.dart';
import 'song_page.dart';

int i = -1;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String getTitle() {
    i++;
    switch (i) {
      case 0:
        return titles[0];
      case 1:
        return titles[1];
      case 2:
        return titles[2];
      case 3:
        return titles[3];
      case 4:
        return titles[4];
      case 5:
        return titles[5];
      case 6:
        return titles[6];
      case 7:
        return titles[7];
      case 8:
        return titles[8];
      case 9:
        return titles[9];
      case 10:
        return titles[10];
      case 11:
        return titles[11];
      case 12:
        return titles[12];
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MUSICX")),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (String u in url)
                ReusableCard(
                    cardW: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      getTitle(),
                      style: TextStyle(color: Colors.black),
                    ),
                    IconButton(
                        icon: Icon(Icons.play_circle_filled),
                        color: Colors.black,
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SongPage(songurl: u)));
                        }),
                  ],
                )),
            ],
          ),
        ],
      ),
    );
  }
}
