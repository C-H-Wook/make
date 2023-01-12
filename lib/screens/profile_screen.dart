import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart';
import 'package:makertone_proto_one/screens/home_screen.dart';
import 'package:makertone_proto_one/screens/rank_screens.dart';

import '../utilities/color.dart';

class profileScreen extends StatefulWidget {
  final String userID;

  const profileScreen({
    super.key,
    required this.userID,
  });

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseUrl = "http://54.83.101.17:8080";
  final String getInfo = "users";
  final String postInfo = "users/addpleges";

  void islandlog(String email, int password) async {
    try {
      Response response = await post(Uri.parse('$baseUrl/$postInfo'),
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
            ],
          ),
        ),
      ),
    );
  }
}
