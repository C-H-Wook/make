import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:makertone_proto_one/screens/home_screen.dart';
import 'package:makertone_proto_one/utilities/color.dart';

class lockscreen extends StatefulWidget {
  const lockscreen({super.key});

  @override
  State<lockscreen> createState() => _lockscreenState();
}

class _lockscreenState extends State<lockscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseUrl = "http://54.83.101.17:8080";
  final String getInfo = "users";
  final String postInfo = "users/signin";

  void login(String email, password) async {
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
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Image.asset(
            'assets/image/incheon_lock.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    login(emailController.text.toString(),
                        passwordController.text.toString());
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: ((context) => homeScreen(
                              userID: emailController.text,
                            )),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: clr_incheonblue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text('Login'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
