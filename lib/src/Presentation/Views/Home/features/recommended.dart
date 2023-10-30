import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedSongs extends StatelessWidget {
  const RecommendedSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0A091E),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    height: size.height/9.227,
                    width: size.width/4.26,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Song name",
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
                        "Artiest name",
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
            );
          }),
    );
  }
}
