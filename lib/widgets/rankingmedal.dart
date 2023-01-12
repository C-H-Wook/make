import 'package:flutter/material.dart';

class RankingMedal extends StatelessWidget {
  final String name;
  final double widt;
  final double heigh;
  final String image;

  const RankingMedal({
    super.key,
    required this.name,
    required this.widt,
    required this.heigh,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widt,
          height: heigh,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
