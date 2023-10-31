import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/audio_player_provider.dart';
// import '../../providers/audio_player_provider.dart';

class MaximizedPlayButton extends StatelessWidget {
  const MaximizedPlayButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var audioPlayerProvider = Provider.of<AudioPlayerProvider>(context);
    return SizedBox(
      height: 80,
      width: 80,
      child: IconButton(
          onPressed: audioPlayerProvider.play,
          icon: audioPlayerProvider.isPlaying
              ? Image.asset('assets/player/pause_button.png')
              : Image.asset('assets/player/play_button.png')),
    );
  }
}