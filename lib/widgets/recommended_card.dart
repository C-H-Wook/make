import 'package:flutter/material.dart';
import 'package:makertone_proto_one/model/place_models.dart';
import 'package:makertone_proto_one/utilities/color.dart';

class RecommendCard extends StatelessWidget {
  final PlaceInfo placeInfo;
  final VoidCallback press;
  const RecommendCard({
    required this.placeInfo,
    required this.press,
    Key? key,
  }) : super(key: key);

  get clr_white => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            color: clr_white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(placeInfo.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                placeInfo.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: kPrimaryClr,
                  ),
                  Text(
                    placeInfo.location,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
