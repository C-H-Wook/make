import 'package:flutter/material.dart';
import 'package:makertone_proto_one/model/place_models.dart';
import 'package:makertone_proto_one/screens/detailscreen.dart';
import 'package:makertone_proto_one/screens/qrscan.dart';
import 'package:makertone_proto_one/utilities/color.dart';
import 'package:makertone_proto_one/widgets/category_card.dart';

import '../widgets/recommended_card.dart';

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
      backgroundColor: clr_incheonblue,
      /*bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(children: [
            Image.asset(
              'assets/image/home.png',
              height: 35,
              width: 35,
              color: kPrimaryClr,
            ),
            Image.asset(
              'assets/image/list.png',
              height: 35,
              width: 35,
              color: kPrimaryClr,
            ),
            Image.asset(
              'assets/image/bookmark.png',
              height: 35,
              width: 35,
              color: kPrimaryClr,
            )
          ]),
        ),
      ),*/
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
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/image/user.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "안녕하세요\n",
                          style: const TextStyle(
                            color: clr_white,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: widget.userID,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            )
                          ]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                //search Section
                const Text(
                  "인천 섬 투어",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: clr_white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5, //elevate the entire search box
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    decoration: BoxDecoration(
                      color: clr_skyblue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  color: clr_white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                hintText: "검색",
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: clr_white,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: kPrimaryClr,
                            child: Icon(
                              Icons.sort_by_alpha_sharp,
                              color: clr_white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                //Category
                ,
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Text(
                      '기능 선택',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: clr_white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
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
                ),
                //Recommended

                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Text(
                      '인천의 섬',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: clr_white,
                      ),
                    ),
                  ],
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
                                                placeInfo: places[index])));
                                  },
                                ),
                              ],
                            ),
                          );
                        })))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
