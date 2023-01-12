import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:makertone_proto_one/utilities/color.dart';
import 'package:http/http.dart' as http;

class qrscan extends StatefulWidget {
  @override
  State<qrscan> createState() => _qrscanState();
}

class _qrscanState extends State<qrscan> {
  String _scanQR = 'Unknown';
  bool isScanned = false;

  @override
  void initState() {
    super.initState();
    isScanned = false;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String baseUrl = "http://54.83.101.17:8080";
  String getInfo = "users";
  String qrInfo = "users/addqrlog";
  String result = "";
  String result2 = "";
  int stampcount = 0;

  Future<void> qrCheck() async {
    String userId = 'abc';
    String islandId = '1';
    String qrId = '1';

    try {
      final response = await http.post(Uri.parse('$baseUrl/$qrInfo'), body: {
        'user_id': userId,
        'island_id': result,
        'qr_id': result2,
      });
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 302) {
        //var data = jsonDecode(response.body.toString());
        //print(data['token']);
        print('Login successfully');
        print(_scanQR);
      } else {
        print('failed');
        print(_scanQR);
      }
      setState(() {
        if (result == "01") {
          _scanQR = "백령도";
        } else if (result == "02") {
          _scanQR = "무의도";
        } else {
          _scanQR = "UnKnown";
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //qr 관련 섬정보 보내기
  Future<void> scanQR() async {
    String scanRes;
    try {
      scanRes = await FlutterBarcodeScanner.scanBarcode(
          '#FF6666', 'Cancel', true, ScanMode.QR);
      print(scanRes);
    } on PlatformException {
      scanRes = 'Failed';
    }
    setState(() {
      _scanQR = scanRes;
      result = _scanQR.substring(0, 2);
      result2 = _scanQR.substring(3);
    });
  }

//qr 개수세기
  Future<void> stampCheck() async {
    try {
      final response = await http
          .post(Uri.parse('http://54.83.101.17:8080/users/qrcounts'), body: {
        'user_id': "abc",
      });
      print(response.statusCode);
      print(response.body);
      setState(() {
        stampcount = int.parse(response.body);
      });

      if (response.statusCode == 200 || response.statusCode == 302) {
        //var data = jsonDecode(response.body.toString());
        //print(data['token']);
        print('Login successfully');
        print(_scanQR);
      } else {
        print('failed');
        print(_scanQR);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'QR SCAN',
            style: TextStyle(
              color: clr_black,
            ),
          ),
          backgroundColor: clr_white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 220),
              Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: clr_white,
                    ),
                    alignment: Alignment.center,
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (isScanned != true)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    backgroundColor: clr_white,
                                  ),
                                  onPressed: () {
                                    isScanned = true;
                                    scanQR();
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.qr_code_scanner_rounded,
                                        color: clr_black,
                                        size: 45,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'QR 스캔',
                                        style: TextStyle(
                                          fontSize: 28,
                                          color: clr_black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (isScanned)
                          Column(
                            children: [
                              SizedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    qrCheck();
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: clr_white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.qr_code_scanner_rounded,
                                            color: clr_black,
                                          ),
                                          Text(
                                            'QR 스캔',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    qrCheck();
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: clr_white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        '섬 이름 확인',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    stampCheck();
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: clr_white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        'QR 스탬프 전송',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text('$_scanQR\n',
                                  style: const TextStyle(fontSize: 20)),
                            ],
                          )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector newMethod2() {
    return GestureDetector(
      onTap: () {
        stampCheck();
      },
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: clr_white, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text(
            'QR 스탬프 전송',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector newMethod() {
    return GestureDetector(
      onTap: () {
        qrCheck();
      },
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: clr_white, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text(
            '섬 이름 확인',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
