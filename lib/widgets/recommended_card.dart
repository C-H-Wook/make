import 'package:flutter/material.dart';
import 'package:makertone_proto_one/model/place_models.dart';

class RecommendCard extends StatelessWidget {
  final PlaceInfo placeInfo;
  final VoidCallback press;

  const RecommendCard({
    required this.placeInfo,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 450,
          width: 280,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: const AlignmentDirectional(-1, 0),
              image: AssetImage(placeInfo.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
