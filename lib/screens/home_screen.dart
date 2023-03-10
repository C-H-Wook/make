import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:makertone_proto_one/model/place_models.dart';
import 'package:makertone_proto_one/screens/detailscreen.dart';
import 'package:makertone_proto_one/screens/profile_screen.dart';
import 'package:makertone_proto_one/screens/qrscan.dart';
import 'package:makertone_proto_one/screens/rank_screens.dart';
import 'package:makertone_proto_one/utilities/color.dart';
import 'package:makertone_proto_one/widgets/category_card.dart';
import 'package:makertone_proto_one/widgets/recommended_card.dart';

import 'locationScreen.dart';

class homeScreen extends StatefulWidget {
  final String userID;
  const homeScreen({
    super.key,
    required this.userID,
  });

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr_white,
      bottomNavigationBar: GNav(tabs: [
        const GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.add_location_outlined,
          text: 'Location',
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const locationScreen(),
                )),
          },
        ),
        GButton(
          icon: Icons.align_vertical_bottom_rounded,
          text: 'Ranking',
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RankScreen(
                    userID: widget.userID,
                  ),
                ))
          },
        ),
        GButton(
          icon: Icons.account_circle_outlined,
          text: 'Profile',
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => profileScreen(
                  userID: widget.userID,
                ),
              ),
            )
          },
        ),
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //appBar
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/icon_flag.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                //search Section

                const SizedBox(
                  height: 20,
                ),

                //Category
                //attributeList(),
                const SizedBox(
                  height: 15,
                ),
                //attributeList_boxes(context),
                //Recommended

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '???????????? ?????? ??? Top 5\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: clr_black,
                          ),
                          children: [
                            TextSpan(
                              text: '???????????? ????????? ????????? ??????',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: clr_black),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            '????????? ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ]),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 370,
                  child: ListView.builder(
                    itemCount: places.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 30),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: RecommendCard(
                                placeInfo: places[index],
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => detailScreen(
                                                placeInfo: places[index],
                                                userId: widget.userID,
                                              )));
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                category_card(
                    title: "QR CODE",
                    image: "assets/image/qrscan.jpg",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => qrscan(),
                            fullscreenDialog: false,
                          ));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
  SizedBox attributeList_boxes(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              category_card(
                title: "QR CODE",
                image: "assets/image/qrscan.jpg",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => qrscan(),
                        fullscreenDialog: false,
                      ));
                },
              ),
              category_card(
                title: "??????",
                image: "assets/image/ranking.png",
                press: () {},
              ),
              category_card(
                title: "?????????",
                image: "assets/image/contract.jpg",
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row attributeList() {
    return Row(
      children: const [
        Text(
          '?????? ??????',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: clr_black,
          ),
        ),
      ],
    );
  }
}*/
