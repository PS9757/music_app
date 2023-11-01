import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Src/Presentation/Views/Home/features/recentlyplayed_bloc/recentlyplayed_bloc.dart';
import 'package:music_app/Src/Presentation/Views/Home/features/recentlyplayed_bloc/recentlyplayed_event.dart';
import 'package:music_app/Src/Presentation/Views/Home/features/recomended_bloc/recomended_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
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
  @override
  void initState() {
    super.initState();
    RecentlyplayedBloc().add(FetchRecentlyPlayedData());

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RecentlyplayedBloc().add(FetchRecentlyPlayedData());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A091E),
      body: BlocBuilder<RecentlyplayedBloc, RecentlyplayedState>(
        bloc: RecentlyplayedBloc()..add(FetchRecentlyPlayedData()),
        builder: (context, state) {
          if (state is changedata) {
            var recentList = state.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: recentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(recentList);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MaximizedPlayerScreen(
                            artist: recentList[index]['artist'],
                            name: recentList[index]['name'],
                            photo: recentList[index]['photo'],
                            url: recentList[index]['url'],
                            identifier: recentList[index]['identifier'],
                            playlist: [],
                          ),
                        ),
                      );
                    },
                    onLongPress: () {
                      final audioPlayer = Provider.of<AudioPlayerProvider>(
                              context,
                              listen: false)
                          .audioPlayer;
                      audioPlayer?.pause();
                    },
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            height: size.height / 10.15,
                            width: size.width / 3.712,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                recentList[index]['photo'],
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text(
                          recentList[index]['name'],
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
                });
          }
          return Container();
        },
      ),
    );
  }
}
