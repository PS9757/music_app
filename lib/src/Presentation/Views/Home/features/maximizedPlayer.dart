import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../utils/music_player/modal/customizer/named_player_customizer.dart';
import '../../../../utils/music_player/pages/maximized_music_player.dart';
import '../../../../utils/music_player/provider/audio_player_provider.dart';

class TheMaximizedPlayerRoute extends MaterialPageRoute {
  TheMaximizedPlayerRoute()
      : super(
          builder: (BuildContext context) => MaximizedMusicPlayer(
            playerCustomizer: NamedPlayerCustomizer(
              songTitleRowRight: Text("Song Title"),
              midRowFarLeft: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  print("hjdsvjf");
                  Fluttertoast.showToast(
                      msg: "Added to Favourites",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.white,
                      textColor: Colors.black);
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
          ),
        );
}
