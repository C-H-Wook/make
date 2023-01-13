import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:makertone_proto_one/model/data/rankingmodel.dart';
import 'package:makertone_proto_one/screens/home_screen.dart';
import 'package:makertone_proto_one/screens/profile_screen.dart';
import 'package:makertone_proto_one/utilities/color.dart';
import 'package:http/http.dart' as http;

class RankScreen extends StatefulWidget {
  final String userID;
  const RankScreen({
    super.key,
    required this.userID,
  });

  @override
  State<RankScreen> createState() => _RankScreenState();
}

var first = '';
var second = '';
var third = '';
var forth = '';
var fifth = '';
var first1 = '';
var second1 = '';
var third1 = '';
var forth1 = '';
var fifth1 = '';

class _RankScreenState extends State<RankScreen> {
  List<String> Mem = [];
  List<String> ran = [];
  void getRanking() async {
    final url = Uri.parse('http://54.83.101.17:8080/data/ranking');
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 302) {
      final List<dynamic> rankings = jsonDecode(response.body);
      List<String> Mem2 = [];
      List<String> ran2 = [];
      for (var ranking in rankings) {
        final Rank = RankingModel.fromJson(ranking);
        print(Rank.user_id);
        Mem2.add(Rank.user_id);
        ran2.add(Rank.qr_count.toString());
      }
      setState(() {
        Mem = Mem2;
        ran = ran2;
      });

      print(Mem);
      first = Mem[0];
      second = Mem[1];
      third = Mem[2];
      forth = Mem[3];
      fifth = Mem[4];
      print(ran);
      first1 = ran[0];
      second1 = ran[1];
      third1 = ran[2];
      forth1 = ran[3];
      fifth1 = ran[4];
      return;
    }
    throw Error();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr_white,
      bottomNavigationBar: GNav(tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => homeScreen(userID: widget.userID))),
          },
        ),
        const GButton(
          icon: Icons.add_location_outlined,
          text: 'Location',
        ),
        const GButton(
          icon: Icons.align_vertical_bottom_rounded,
          text: 'Ranking',
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
      appBar: AppBar(
        title: const Text("Ranking"),
        shadowColor: Colors.white,
        backgroundColor: clr_white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              height: 40,
              width: 400,
              child: Row(children: const [
                SizedBox(width: 5),
                Text('랭킹'),
                SizedBox(width: 90),
                Text("닉네임(아이디)"),
                SizedBox(width: 97),
                Text("스탬프"),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "1",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                Text(first),
                const SizedBox(width: 140),
                Text(first1),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "2",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                Text(second),
                const SizedBox(width: 141),
                Text(second1),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "3",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                Text(third),
                const SizedBox(width: 120),
                Text(third1),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "4",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                Text(forth),
                const SizedBox(width: 112),
                Text(forth1),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "5",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                Text(fifth),
                const SizedBox(width: 104),
                Text(fifth1),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "6",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                const Text("")
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "7",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                const Text("")
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "8",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                const Text("")
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              height: 66,
              width: 400,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(children: [
                const Text(
                  "9",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 105),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                Text(widget.userID),
                const Text("")
              ]),
            ),
            SizedBox(
              child: GestureDetector(
                onTap: () {
                  getRanking();
                },
                child: Container(
                  width: 200,
                  height: 90,
                  decoration: BoxDecoration(
                      color: clr_white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      '내 랭킹은?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
