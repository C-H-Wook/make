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
        const GButton(
          icon: Icons.add_location_outlined,
          text: 'Location',
        ),
        GButton(
          icon: Icons.align_vertical_bottom_rounded,
          text: 'Ranking',
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RankScreen(),
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
                          text: '큐레이션\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: clr_black,
                          ),
                          children: [
                            TextSpan(
                              text: '일상을 특별하게 만들어줄 공간 가이드',
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
                            '스크롤',
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
                  height: 350,
                  child: ListView.builder(
                    itemCount: places.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 30),
                        child: Row(
                          children: [
                            RecommendCard(
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
                title: "랭킹",
                image: "assets/image/ranking.png",
                press: () {},
              ),
              category_card(
                title: "서약서",
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
          '기능 선택',
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
