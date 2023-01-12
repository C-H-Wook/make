import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:makertone_proto_one/screens/home_screen.dart';
import 'package:makertone_proto_one/screens/rank_screens.dart';

import '../model/place_models.dart';
import '../utilities/color.dart';
import '../widgets/island_card.dart';

class profileScreen extends StatefulWidget {
  final String userID;

  const profileScreen({
    super.key,
    required this.userID,
  });

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class ApiService {
  final String baseUrl = "http://54.83.101.17:8080/";
  final String today = "/qrcodes";
}

class _profileScreenState extends State<profileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseUrl = "http://54.83.101.17:8080";
  final String getInfo = "users";
  final String postInfo = "users/addpleges";
  bool isa1 = false;
  bool isa2 = false;

  void islandlog(String email, int password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/$postInfo'),
          body: {'id': email, 'pw': password});

      if (response.statusCode == 200) {
        //var data = jsonDecode(response.body.toString());
        //print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  int temp = 0;
  int counter = 0;
  List<int> isl2 = [];

  Future<void> islandcount2() async {
    String userId = 'abc';
    print(userId);
    final response = await http
        .post(Uri.parse('http://54.83.101.17:8080/users/myqrcodes'), body: {
      'user_id': userId,
    });

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 302) {
      //var data = jsonDecode(response.body.toString());
      //print(data['token']);
      final List<dynamic> islands = jsonDecode(response.body);
      print(islands);
      List<int> isl = [];
      setState(() {
        for (int i = 0; i < islands.length; i++) {
          isl.add(islands[i][0] * 10 + islands[i][1]);
        }
        isl2 = isl;
        print(isl2);
        counter = islands.length;
      });

      return;
    } else {
      print('failed');
    }
  }

  @override
  void initState() {
    super.initState();

    islandcount2();
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
                  builder: (context) => homeScreen(
                    userID: widget.userID,
                  ),
                ))
          },
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
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
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
                    width: 130,
                  ),
                  const CircleAvatar(
                      backgroundImage: AssetImage(
                    'assets/image/user.png',
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "안녕하세요\n",
                        style: const TextStyle(
                          color: clr_black,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: widget.userID,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemCount: isl2.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        temp = isl2[index];

                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 30),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: islandCard(
                                  is_num: temp % 10,
                                  placeInfo: places[index],
                                  press: () {},
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
