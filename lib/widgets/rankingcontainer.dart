import 'package:flutter/material.dart';

class RankingContainer extends StatelessWidget {
  final double bottom;
  final String ranking;
  final String name;
  final String many;

  const RankingContainer({
    super.key,
    required this.bottom,
    required this.ranking,
    required this.name,
    required this.many,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: 0,
      left: 0,
      child: Container(
        height: 80,
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
        child: Row(
          children: [
            Text(
              ranking,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 69,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            const Icon(
              Icons.thumb_up_outlined,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              many,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
