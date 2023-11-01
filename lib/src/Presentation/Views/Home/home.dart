import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Src/Presentation/Views/Home/features/recently_played.dart';
import 'features/recommended.dart';
import 'features/search_bloc/search_bar_focus_bloc.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  bool isSearchFocused = false;
  late SearchBarFocusBloc searchBarFocusBloc;

  @override
  void initState() {
    super.initState();
    searchBarFocusBloc = SearchBarFocusBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SearchBarFocusBloc, bool>(
        bloc: searchBarFocusBloc,
        builder: (context, isSearchFocused) {
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            color: Colors.purple,
            child: Scaffold(
                backgroundColor: Color(0xff0A091E),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 21.0, right: 21.0, top: 21.0),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: size.height,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: size.width * .024),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Welcome",
                                          style: const TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffdedede),
                                            height: 20 / 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Priyanshu",
                                          style: const TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffdedede),
                                            height: 20 / 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.notifications, color: Colors.white),
                              ],
                            ),
                            SizedBox(height: size.height * .024),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width / 2.34,
                                  child: Text(
                                    "Listen The \nLatest Musics",
                                    style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xfff3f3f3),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 2.34,
                                  child: TextField(
                                    onTap: () {
                                      searchBarFocusBloc
                                          .add(SearchBarFocusEvent.focus);
                                    },
                                    onTapOutside: (input) {
                                      searchBarFocusBloc
                                          .add(SearchBarFocusEvent.unfocus);
                                      FocusScope.of(context).unfocus();
                                    },
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffdedede),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffdedede),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                                visible: !isSearchFocused,
                                child: SizedBox(height: 44)),
                            Visibility(
                              visible: !isSearchFocused,
                              child: Text(
                                "Recently Played",
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xfff3f3f3),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Visibility(
                              visible: !isSearchFocused,
                              child: SizedBox(
                                height: 10,
                              ),
                            ),
                            Visibility(
                              visible: !isSearchFocused,
                              child: SizedBox(
                                  height: size.height / 8,
                                  child: RecentlyPlayed()),
                            ),
                            Visibility(
                                visible: !isSearchFocused,
                                child: SizedBox(height: 28)),
                            Visibility(
                              visible: !isSearchFocused,
                              child: Text(
                                "Recommend for you",
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xfff3f3f3),
                                  height: 18 / 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Visibility(
                              visible: !isSearchFocused,
                              child: SizedBox(
                                height: 10,
                              ),
                            ),
                            Visibility(
                                visible: !isSearchFocused,
                                child: Expanded(child: RecommendedSongs()))
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          );
        });
  }
}
