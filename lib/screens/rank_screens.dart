import 'package:flutter/material.dart';
import 'package:makertone_proto_one/utilities/color.dart';
import '../widgets/rankingcontainer.dart';
import '../widgets/rankingcontainer2.dart';
import '../widgets/rankingmedal.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdbf0f9),
      appBar: AppBar(
        backgroundColor: clr_white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.segment_outlined,
            ),
            Text(
              "Ranking",
            ),
            Icon(
              Icons.share_outlined,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20, width: 5),
                  const RankingMedal(
                      name: '이종진2',
                      widt: 60,
                      heigh: 60,
                      image: 'assets/image/user.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 60,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 25),
                    child: const Text(
                      "2",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const RankingMedal(
                      name: '이종진1',
                      widt: 60,
                      heigh: 60,
                      image: 'assets/image/user.png'),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 60,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
                    child: const Text(
                      "1",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 40, width: 5),
                  const RankingMedal(
                      name: '이종진3',
                      widt: 60,
                      heigh: 60,
                      image: 'assets/image/user.png'),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 60,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: const Text(
                      "3",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const RankingContainer(
            bottom: 0,
            ranking: "9등",
            name: "이종진9",
            many: "1",
          ),
          const RankingContainer2(
            bottom: 80,
          ),
          const RankingContainer(
            bottom: 82,
            ranking: "8등",
            name: "이종진8",
            many: "2",
          ),
          const RankingContainer2(
            bottom: 162,
          ),
          const RankingContainer(
            bottom: 164,
            ranking: "7등",
            name: "이종진7",
            many: "3",
          ),
          const RankingContainer2(
            bottom: 244,
          ),
          const RankingContainer(
            bottom: 246,
            ranking: "6등",
            name: "이종진6",
            many: "4",
          ),
          const RankingContainer2(
            bottom: 326,
          ),
          const RankingContainer(
            bottom: 328,
            ranking: "5등",
            name: "이종진5",
            many: "5",
          ),
          const RankingContainer2(
            bottom: 408,
          ),
          Positioned(
            bottom: 9,
            left: 50,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/image/user.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 91,
            left: 50,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/image/user.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 173,
            left: 50,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/image/user.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 255,
            left: 50,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/image/user.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 337,
            left: 50,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/image/user.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 410,
            right: 0,
            left: 0,
            child: Container(
              height: 80,
              width: 300,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
              child: Row(
                children: const [
                  Text(
                    "4등",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 69,
                  ),
                  Text(
                    "이종진4",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(
                    Icons.thumb_up_outlined,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "9",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 419,
            left: 50,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/image/user.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
