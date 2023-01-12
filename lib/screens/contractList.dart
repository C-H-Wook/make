import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:makertone_proto_one/model/place_models.dart';
import 'package:makertone_proto_one/utilities/color.dart';

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
  TextEditingController userIdController = TextEditingController();
  TextEditingController islandIdController = TextEditingController();
  final String baseUrl = "http://54.83.101.17:8080";
  final String getInfo = "users";
  final String postInfo = "users/addpleges";

  Future<void> islandCheck() async {
    try {
      final response = await http
          .post(Uri.parse('http://54.83.101.17:8080/users/qrcounts'), body: {
        'user_id': widget.userId,
        'island_id': widget.placeInfo.id,
      });
      print(response.statusCode);

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr_skyblue,
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
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.placeInfo.contract1),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.placeInfo.contract2),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.placeInfo.contract3),
          fit: BoxFit.fill,
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        islandCheck();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kPrimaryClr,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              Text(
                '서약에 동의하면 누르세요!',
                style: TextStyle(
                  color: clr_black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];
}
