import 'package:flutter/material.dart';
import 'package:makertone_proto_one/utilities/color.dart';

class category_card extends StatelessWidget {
  final String title, image;
  final VoidCallback press;
  const category_card({
    required this.title,
    required this.image,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        bottom: 8,
      ),
      child: InkWell(
        onTap: press,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 70,
            width: 180,
            decoration: BoxDecoration(
              color: clr_white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
