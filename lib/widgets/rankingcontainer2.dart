import 'package:flutter/material.dart';

class RankingContainer2 extends StatelessWidget {
  final double bottom;

  const RankingContainer2({
    super.key,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: 0,
      left: 0,
      child: Container(
        height: 2,
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      ),
    );
  }
}
