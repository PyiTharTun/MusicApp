import 'song.dart';

class Playlist{
  final List<Songs> _myplaylist = [
    Songs(songurl: 'https://webtestingforme.000webhostapp.com/Mp3/audio1.mp3', 
    artist: 'BodyBack', 
    name: 'MAIA WRIGHT',
    artwork: 'BodyBack.png'),
    Songs(songurl: 'https://webtestingforme.000webhostapp.com/Mp3/audio2.mp3',
     artist: 'Imaging Dragon', 
     name: '2',
     artwork: 'Bad Liar.png'),
    Songs(songurl: 'https://webtestingforme.000webhostapp.com/Mp3/audio3.mp3', 
    artist: '3', 
    name: 'lay phyu',
    artwork: 'halo.jpeg'),
    
  ];
  String getUrl(int playerindex){
    return _myplaylist[playerindex].songurl;
  }
  String getArtist(int playerindex){
    return _myplaylist[playerindex].artist;
  }
  String? getArtwork (int playerindex){
    return _myplaylist[playerindex].artwork;
  }
  String getName(int playerindex){
    return _myplaylist[playerindex].name;
  }

}
