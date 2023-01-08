import 'package:flutter/material.dart';
import 'package:makertone_proto_one/model/place_models.dart';
import 'package:makertone_proto_one/utilities/color.dart';

class detailScreen extends StatefulWidget {
  final PlaceInfo placeInfo;
  const detailScreen({
    super.key,
    required this.placeInfo,
  });

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: clr_white,
        body: Stack(
          children: [
            Image.asset(
              widget.placeInfo.image,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5, //Image Size
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
                                    Icons.arrow_back_ios,
                                    color: clr_white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                        ),
                      ],
                    ),
                  ),

                  ///
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
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
                                MaterialButton(
                                  color: kPrimaryClr,
                                  minWidth: double.infinity,
                                  height: 45,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    '서약서',
                                    style: TextStyle(
                                      color: clr_white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Details:",
                                  style: TextStyle(
                                    color: clr_black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  widget.placeInfo.desc,
                                  style: const TextStyle(
                                    color: clr_black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Divider(
                                  height: 5,
                                  color: clr_black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Duration',
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
                                      'Ship Time',
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