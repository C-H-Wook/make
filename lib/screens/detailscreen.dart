import 'package:flutter/material.dart';
import 'package:makertone_proto_one/model/place_models.dart';
import 'package:makertone_proto_one/utilities/color.dart';

import 'contractList.dart';

class detailScreen extends StatefulWidget {
  final PlaceInfo placeInfo;
  final String userId;

  const detailScreen({
    super.key,
    required this.placeInfo,
    required this.userId,
  });

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    bool check = false;
    print(check);
    return Scaffold(
        backgroundColor: clr_white,
        body: Stack(
          children: [
            Image.asset(
              widget.placeInfo.image,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8, //Image Size
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Column(
                children: [
                  //AppBar Button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(100),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    color: kPrimaryClr, shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: clr_black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Widget
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(100),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                  color: clr_white, shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.bookmark_rounded,
                                  color: kPrimaryClr,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ), //Bookmark widget
                      ],
                    ),
                  ),

                  ///
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: clr_white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.placeInfo.name,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => contractList(
                                                placeInfo: widget.placeInfo,
                                                userId: widget.userId,
                                              )),
                                          fullscreenDialog: true,
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: clr_white,
                                      ),
                                      width: double.infinity,
                                      height: 75,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.library_books_outlined,
                                                size: 35,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: const [
                                                  Text(
                                                    '서약서',
                                                    style: TextStyle(
                                                      color: clr_black,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text('클릭',
                                                      style: TextStyle(
                                                        color: clr_black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "섬 설명",
                                      style: TextStyle(
                                        color: clr_black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                        Icons.keyboard_double_arrow_down_sharp),
                                  ],
                                ),
                                // Text(
                                //   widget.placeInfo.desc,
                                //   style: const TextStyle(
                                //     color: clr_black,
                                //     fontSize: 20,
                                //     fontWeight: FontWeight.w700,
                                //   ),
                                // ),
                                const Divider(
                                  height: 3,
                                  color: clr_black,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      '추천하는 여행 기간',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      '${widget.placeInfo.days} days',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    const Text(
                                      '도착 소요 시간',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      '${widget.placeInfo.hour} hrs',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
