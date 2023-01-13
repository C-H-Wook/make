import 'package:flutter/material.dart';
import 'package:makertone_proto_one/model/place_models.dart';

import '../utilities/color.dart';

class islandCard extends StatelessWidget {
  final PlaceInfo placeInfo;
  final VoidCallback press;
  final int is_num;

  const islandCard({
    required this.placeInfo,
    required this.press,
    required this.is_num,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Material(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 600,
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 450,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        alignment: const AlignmentDirectional(-1, 0),
                        image: AssetImage(placeInfo.qr2),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 450,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        alignment: AlignmentDirectional(-1, 1),
                        image: AssetImage('assets/image/stamp_final.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: '${placeInfo.name}에서...\n',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: clr_black,
                  ),
                  children: [
                    TextSpan(
                      text: '$is_num 번째 QR 코드',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: clr_black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
