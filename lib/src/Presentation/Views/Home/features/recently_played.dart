import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/music_player/modal/customizer/named_player_customizer.dart';
import '../../../../utils/music_player/pages/maximized_music_player.dart';
import '../../../../utils/music_player/provider/audio_player_provider.dart';
import '../../../Widgets/play_audio.dart';
import 'maximizedPlayer.dart';

class RecentlyPlayed extends StatefulWidget {
  const RecentlyPlayed({Key? key}) : super(key: key);

  @override
  State<RecentlyPlayed> createState() => _RecentlyPlayedState();
}

class _RecentlyPlayedState extends State<RecentlyPlayed> {
  // AudioPlayerLogic audioPlayerLogic = AudioPlayerLogic();
  // @override
  @override
  void initState() {
    super.initState();

    // Use Future.microtask to schedule the call after the build process.
    // Future.microtask(() {
    //   Provider.of<AudioPlayerProvider>(context, listen: false)
    //       .setAudioSource(audioPlayerLogic.playlist, 0);
      // Alternatively, for playing a single track, use setSingleAudioSource
      // Provider.of<AudioPlayerProvider>(context, listen: false)
      //     .setSingleAudioSource(audioPlayerLogic.song);
    // });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A091E),
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaximizedPlayerScreen(artist: "null", name: "null", photo: "null", url: "null", identifier: 0) as Route<Object?>);
                // Provider.of<AudioPlayerProvider>(context, listen: false).play();
                // MaximizedMusicPlayer(
                //   playerCustomizer: NamedPlayerCustomizer(
                //     // songTitleRowRight: FavoriteButton(),
                //     // midRowFarLeft: QueueButton(),
                //     // midRowFarRight: ShuffleButton(),
                //     // midRowRight: RepeatButton(),
                //   ),
                //   backgroundDecoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: const Alignment(1, 1),
                //       colors: <Color>[
                //         Provider.of<AudioPlayerProvider>(context).dominantColor,
                //         const Color.fromRGBO(32, 32, 32, 1)
                //       ],
                //       tileMode: TileMode.decal,
                //     ),
                //   ),
                // );

              },
              onLongPress: () {
                final audioPlayer = Provider.of<AudioPlayerProvider>(context, listen: false).audioPlayer;
                audioPlayer?.pause();
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: size.height/10.15,
                    width: size.width/3.712,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Text(
                    "The triangle",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xfff3f3f3),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }),
    );
  }
}
