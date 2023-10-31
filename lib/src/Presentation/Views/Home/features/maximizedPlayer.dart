import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../utils/music_player/modal/customizer/named_player_customizer.dart';
import '../../../../utils/music_player/modal/player/audio_track.dart';
import '../../../../utils/music_player/pages/maximized_music_player.dart';
import '../../../../utils/music_player/provider/audio_player_provider.dart';

class MaximizedPlayerScreen extends StatefulWidget {
  final String artist;
  final String name;
  final String photo;
  final String url;
  final int identifier;

  MaximizedPlayerScreen({
    required this.artist,
    required this.name,
    required this.photo,
    required this.url,
    required this.identifier,
  });

  @override
  _MaximizedPlayerScreenState createState() => _MaximizedPlayerScreenState();
}

class _MaximizedPlayerScreenState extends State<MaximizedPlayerScreen> {
  var audioTrack;
  @override
  Widget build(BuildContext context) {
    // Create an AudioTrack for the selected song
    audioTrack = AudioTrack(
      widget.identifier,  // Replace with a unique ID or appropriate identifier
      title: widget.name,
      artist: widget.artist,
      duration: Duration(seconds: 180), // Replace with the actual duration
      // Set the correct audio URL for your track
      networkUrl: widget.url,
    );
    // print("================================${audioTrack.networkUrl}");

    // Set the audioTrack in AudioPlayerProvider
    final audioPlayerProvider = Provider.of<AudioPlayerProvider>(context, listen: false);
    audioPlayerProvider.setSingleAudioSource(audioTrack);

    return MaximizedMusicPlayer(
      albumCover: Image.network(widget.photo),
      playerCustomizer: NamedPlayerCustomizer(
        // songTitleRowRight: Text(widget.name),
        midRowFarLeft: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            print("hjdsvjf");
            Fluttertoast.showToast(
              msg: "Added to Favourites",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            );
          },
        ),
        midRowFarRight: IconButton(
          icon: Icon(Icons.shuffle),
          onPressed: () {
            // Handle shuffle button action here
          },
        ),
        midRowRight: IconButton(
          icon: Icon(Icons.repeat),
          onPressed: () {
            // Handle repeat button action here
          },
        ),
      ),
      backgroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 1),
          colors: [
            Provider.of<AudioPlayerProvider>(context).dominantColor,
            Color.fromRGBO(32, 32, 32, 1),
          ],
          tileMode: TileMode.decal,
        ),
      ),
    );
  }

}
