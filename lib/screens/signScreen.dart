import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../utilities/color.dart';

class signScreen extends StatefulWidget {
  const signScreen({super.key});

  @override
  State<signScreen> createState() => _signScreenState();
}

class _signScreenState extends State<signScreen> {
  Uint8List? exportedImage;
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
    exportBackgroundColor: Colors.yellow,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr_white,
        title: const Text(
          "서명란",
          style: TextStyle(
            color: clr_black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: clr_white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Signature(
                controller: controller,
                height: 250,
                width: MediaQuery.of(context).size.width / 1.005,
                backgroundColor: clr_white,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        exportedImage = await controller.toPngBytes();
                        setState(() {});
                      },
                      child: const Text("저장"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.clear();
                      },
                      child: const Text("재시도"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (exportedImage != null)
                Image.memory(
                  exportedImage!,
                  width: 300,
                  height: 300,
                ),
              if (exportedImage != null)
                ElevatedButton(
                  onPressed: () async {
                    exportedImage = await controller.toPngBytes();
                    setState(() {});
                  },
                  child: const Text("Clear"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
