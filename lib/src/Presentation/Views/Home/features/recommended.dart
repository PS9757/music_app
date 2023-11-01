import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Src/Presentation/Views/Home/features/recomended_bloc/recomended_bloc.dart';
import 'package:music_app/Src/utils/music_player/provider/audio_player_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/music_player/modal/player/audio_track.dart';
import '../../../Widgets/play_audio.dart';
import 'maximizedPlayer.dart';

class RecommendedSongs extends StatefulWidget {
  const RecommendedSongs({Key? key}) : super(key: key);

  @override
  State<RecommendedSongs> createState() => _RecommendedSongsState();
}

class _RecommendedSongsState extends State<RecommendedSongs> {
  @override
  void initState() {
    super.initState();
    RecommendedBloc().add(FetchRecommendedData());
  }

  @override
  Widget build(BuildContext context) {
    // recommendedBloc.add(FetchRecommendedData());
    Size size = MediaQuery.of(context).size;
    List<AudioTrack> playlist = [];
    return Scaffold(
      backgroundColor: Color(0xff0A091E),
      body: BlocBuilder<RecommendedBloc, RecommendedState>(
        bloc: RecommendedBloc()..add(FetchRecommendedData()),
        builder: (context, state) {
          if (state is RecommendedLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RecommendedLoaded) {
            final musicData = state.musicData;
            playlist.addAll(state.playlist);
            print("======================================${musicData}");
            return ListView.builder(
                padding: EdgeInsets.only(bottom: 120),
                physics: BouncingScrollPhysics(),
                itemCount: musicData.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // final audioTrack = AudioTrack(
                      //   index,  // Replace with a unique ID or appropriate identifier
                      //   title: musicData[index]['name'],
                      //   artist: musicData[index]['artist'],
                      //   duration: Duration(seconds: 180),
                      //   // Set the correct audio URL for your track
                      //   networkUrl: musicData[index]['songURL'],
                      // );
                      // playlist.addAll([audioTrack]);
                      // // Set the audioTrack in AudioPlayerProvider
                      // final audioPlayerProvider = Provider.of<AudioPlayerProvider>(context, listen: false);
                      // audioPlayerProvider.setSingleAudioSource(playlist[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaximizedPlayerScreen(
                                    artist: musicData[index]['artist'],
                                    name: musicData[index]['name'],
                                    photo: musicData[index]['photo'],
                                    url: musicData[index]['songURL'],
                                    identifier: index,
                                    playlist: playlist,
                                  )));
                      print(
                          "///////////////=========================${musicData[index]['songURL']}");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: size.height / 9.227,
                            width: size.width / 4.26,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                musicData[index]['photo'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                musicData[index]['name'],
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff3f3f3),
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                musicData[index]['artist'],
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff3f3f3),
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (state is RecommendedError) {
            return Text('Error: ${state.error}');
          } else {
            return Text('Unknown state');
          }
        },
      ),
    );
  }
}
