import 'package:flutter/material.dart';

import '../utilities/color.dart';

class contractList extends StatefulWidget {
  const contractList({super.key});

  @override
  State<contractList> createState() => _contractListState();
}

class _contractListState extends State<contractList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
