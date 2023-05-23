import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'playlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  // AudioPlayerState audioPlayerSate = audioPlayerSate.PAUSED;
  // AudioCache audioCache;
  // String path = "bodyback.mp3";
  // @override
  // void initState(){
  //   super.initState();

  //   audioCache = AudioCache(fixedPlayers: audioPlayer);
  //   audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
  //     setState(() {
  //       audioPlayerSate = s;
  //     });
  //   });
  // }
  // @override
  // void dispose(){
  //   super.dispose();
  //   audioPlayer.release();

  // }
  playLocal() async {
    // var result = await audioPlayer.play("assets/bodyback.mp3", isLocal: true);
    // int result = await audioPlayer.play(myplaylist[playerindex]["url"]);
    int result = await audioPlayer.play(ourplaylist.getUrl(playerindex));
    if(result == 1){
      print(">>>>>Success");
    }
  }
  pauseMusic() async{
    var result = await audioPlayer.pause();
    if (result == 1){
      print(".....Success");
    }
  }
  resume() async{
    int result = await audioPlayer.resume();
    if (result == 1){
      print("....resume...");
    }
  }
  hostop() async{
    int result = await audioPlayer.stop();
    if (result==1){
      print(".....Now stop");
    }
  }
  bool playpause = true;
  int resumeplay = 0;
  int playerindex = 0;
  List myplaylist = [
    {
      "url": "https://webtestingforme.000webhostapp.com/Mp3/audio1.mp3",
      "name":"BodyBack",
      "alburm":"BodyBack.png",
      "artist":"MAIA WRIGHT",
    },
    {
      "url": "https://webtestingforme.000webhostapp.com/Mp3/audio2.mp3",
      "name":"2",
      "alburm":"Bad Liar.png",
      "artist":"Imaging Dragon",
    },
    {
      "url": "https://webtestingforme.000webhostapp.com/Mp3/audio3.mp3",
      "name":"3",
      "alburm":"halo.jpeg",
      "artist":"lay phyu",
    }
  ];
  Playlist ourplaylist = Playlist();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   ourplaylist.myplaylist[0].artist = "Banana";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Music Player'),
      ),
      body: Center(
        child: Column(
          children: [
            GlassContainer(
              
              
              borderColor: Colors.yellow,
              height: 300,
              width: 400,
              gradient: LinearGradient(
                colors: [Colors.white.withOpacity(0.40), Colors.white.withOpacity(0.10)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [Colors.white.withOpacity(0.60), Colors.white.withOpacity(0.10), Colors.lightBlueAccent.withOpacity(0.05), Colors.lightBlueAccent.withOpacity(0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 15.0,
              borderWidth: 1.5,
              elevation: 3.0,
              isFrostedGlass: true,
              shadowColor: Colors.black.withOpacity(0.20),
              alignment: Alignment.center,
              frostedOpacity: 0.12,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Image(
                // image: AssetImage('images/${myplaylist[playerindex]["alburm"]}'),
                // image: AssetImage('images/${ourplaylist.myplaylist[playerindex].artwork}'),
                image: AssetImage('images/${ourplaylist.getArtwork(playerindex)}'),
                ),
            ),
            // Text(ourplaylist.myplaylist[playerindex].name),
            // Text(ourplaylist.myplaylist[playerindex].artist),
            Text(ourplaylist.getName(playerindex)),
            Text(ourplaylist.getArtist(playerindex)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: (){
                    hostop();
                    setState(() {
                      playerindex -=1;
                      if (playerindex <0){
                        playerindex = 2;
                        }
                      playpause = true;
                      
                    });
                    
                },
                ),
                IconButton(
              icon: playpause
                ? const Icon(Icons.play_arrow_rounded)
                : const Icon(Icons.pause_circle),
              iconSize: 50,
              onPressed: (){
                if (resumeplay == 0 ){
                  playLocal();
                  resumeplay = 1;
                }else if (resumeplay == 1){
                  pauseMusic();
                  resumeplay = 2;
                }
                else if (resumeplay == 2){
                  resume();
                  resumeplay = 1;
                }
                setState((){
                  playpause = !playpause;
                });
              },
              ),
              IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: (){
                    hostop();
                    setState(() {
                      playerindex +=1;
                      if (playerindex >2){
                        playerindex = 0;
                        }
                      playpause = true;
                      resumeplay = 0;
                    },);
                    
                },
                ),
              ],
            ),
            
          ],
        ),
        ),
    );
  }
}