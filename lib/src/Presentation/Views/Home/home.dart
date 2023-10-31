import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Src/Presentation/Views/Home/features/recently_played.dart';

import 'features/recommended.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0A091E),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 21.0, top: 21.0),
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
                                  // color: Color(0xff0A091E),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            onTapOutside: (input) {
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
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 44),
                    Text(
                      "Recently Played",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xfff3f3f3),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: size.height / 8, child: RecentlyPlayed()),
                    SizedBox(height: 28),
                    Text(
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
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(child: RecommendedSongs())
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
