import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:makertone_proto_one/model/place_models.dart';
import 'package:makertone_proto_one/utilities/color.dart';

import 'package:http/http.dart' as http;
import 'package:signature/signature.dart';

class contractList extends StatefulWidget {
  final PlaceInfo placeInfo;
  final String userId;

  const contractList({
    super.key,
    required this.placeInfo,
    required this.userId,
  });

  @override
  State<contractList> createState() => _contractListState();
}

class _contractListState extends State<contractList> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseUrl = "http://54.83.101.17:8080";
  final String getInfo = "users";
  final String postInfo = "users/addpleges";
  Uint8List? exportedImage;
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
    exportBackgroundColor: Colors.yellow,
  );

  Future<void> contractCheck() async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/$postInfo'), body: {
        'user_id': widget.userId,
        'island_id': widget.placeInfo.id,
      });
      print(response.statusCode);
      print(response.body);
      print(widget.userId);
      print(widget.placeInfo.id);

      if (response.statusCode == 200 || response.statusCode == 302) {
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
    bool enabled = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr_white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: LiquidSwipe(
              pages: pages,
              slideIconWidget: const Icon(
                Icons.arrow_back_ios,
                size: 35,
              ),
              positionSlideIcon: 0.5,
              waveType: WaveType.liquidReveal,
              enableLoop: false,
              fullTransitionValue: 450,
              //slideReveal if necessary
            ),
          ),
        ),
      ),
    );
  }

  late final pages = [
    GestureDetector(
      onTap: () {
        contractCheck();
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.placeInfo.contract1),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/test1.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];
}
