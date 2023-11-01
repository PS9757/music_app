import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_app/Src/utils/music_player/widgets/minimized_music_player.dart';
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
  final List<AudioTrack> playlist;

  MaximizedPlayerScreen({
    required this.artist,
    required this.name,
    required this.photo,
    required this.url,
    required this.identifier,
    required this.playlist,
  });

  @override
  _MaximizedPlayerScreenState createState() => _MaximizedPlayerScreenState();
}

class _MaximizedPlayerScreenState extends State<MaximizedPlayerScreen> {
  var audioTrack;
  bool isMinimized = false;

  @override
  Widget build(BuildContext context) {
    // Create an AudioTrack for the selected song
    audioTrack = AudioTrack(
      widget.identifier, // Replace with a unique ID or appropriate identifier
      title: widget.name,
      artist: widget.artist,
      duration: Duration(seconds: 180), // Replace with the actual duration
      // Set the correct audio URL for your track
      networkUrl: widget.url,
    );
    // print("================================${audioTrack.networkUrl}");
    final audioPlayerProvider =
        Provider.of<AudioPlayerProvider>(context, listen: false);
    audioPlayerProvider.setSingleAudioSource(audioTrack);

    // Set the audioTrack in AudioPlayerProvider

    return Stack(
      children: [
        MaximizedMusicPlayer(
          albumCover: Image.network(widget.photo),
          appbar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Now Playingcft",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  //fluttertoast
                  Fluttertoast.showToast(
                    msg: "Soon Available",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  );
                },
              ),
            ],
          ),
          playPauseButton: IconButton(
            icon: audioPlayerProvider.isPlaying
                ? Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 25,
                  )
                : Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 25,
                  ),
            onPressed: () {
              // Handle play/pause button action here
              setState(() {
                if (audioPlayerProvider.isPlaying) {
                    audioPlayerProvider.audioPlayer?.pause();
                } else {
                  audioPlayerProvider.playSong();
                }
              });
            },
          ),
          nextButton: IconButton(
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              //fluttertoast
              Fluttertoast.showToast(
                msg: "Soon Available",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.white,
                textColor: Colors.black,
              );
            },
          ),
          previousButton: IconButton(
            icon: Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              //fluttertoast
              Fluttertoast.showToast(
                msg: "Soon Available",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.white,
                textColor: Colors.black,
              );
            },
          ),
          playerCustomizer: NamedPlayerCustomizer(
            // songTitleRowRight: Text(widget.name),
            midRowFarLeft: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print("hjdsvjf");
                Fluttertoast.showToast(
                  msg: "Soon Available",
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
                Fluttertoast.showToast(
                  msg: "Soon Available",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                );
              },
            ),
            midRowRight: IconButton(
              icon: Icon(
                !audioPlayerProvider.repeat
                    ? Icons.repeat
                    : Icons.repeat_one, // Change to your repeat icon
                color: audioPlayerProvider.repeat
                    ? Colors.blue // Change to the color you want for repeat mode
                    : Colors.white, // Change to the color for non-repeat mode
                size: 25,
              ),
              onPressed: () {
                // Toggle repeat mode
                audioPlayerProvider.toggleRepeat();

                // Optionally, show a toast to indicate the repeat mode
                Fluttertoast.showToast(
                  msg: audioPlayerProvider.repeat
                      ? "Repeat mode enabled"
                      : "Repeat mode disabled",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                );
              },
            ),

          ),
          // playPauseButton: IconButton(
          //   icon: Icon(Icons.play_arrow),
          //   onPressed: () {
          //
          //     // Handle play/pause button action here
          //   },
          // ),
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
        ),
        if(isMinimized)
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Material(
                  child: MinimizedMusicPlayer(
                    onTab: (){
                      setState(() {
                        isMinimized = false;
                      });
                    },
                    color: audioPlayerProvider.dominantColor,
                    nextButton: IconButton(
                      onPressed: audioPlayerProvider.next,
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                      ),
                    ),
                    progressBarBackgroundColor: Colors.white10,
                    progressBarColor: Colors.white,
                  ),
                ))
      ],
    );
  }
}
