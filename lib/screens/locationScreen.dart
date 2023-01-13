import 'package:flutter/material.dart';
import 'package:makertone_proto_one/utilities/color.dart';

class locationScreen extends StatefulWidget {
  const locationScreen({super.key});

  @override
  State<locationScreen> createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr_white,
        title: const Text(
          "위치 표시",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/modo_map.png'),
                  ),
                )),
            Container(
                clipBehavior: Clip.hardEdge,
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/daejak_map.png"),
                  ),
                )),
            Container(
                clipBehavior: Clip.hardEdge,
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/seojak_map.png'),
                  ),
                )),
            Container(
                clipBehavior: Clip.hardEdge,
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/mooeu_map.png'),
                  ),
                )),
            Container(
                clipBehavior: Clip.hardEdge,
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/baekryung_pic.png'),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
