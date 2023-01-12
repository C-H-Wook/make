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
  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String baseUrl = "http://54.83.101.17:8080";
  String getInfo = "users";
  String qrInfo = "users/addqrlog";
  String result = "";
  String result2 = "";

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
    } catch (e) {
      print(e.toString());
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR SCAN'),
          backgroundColor: clr_incheonblue,
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: clr_incheonblue,
                      ),
                      onPressed: () => scanQR(),
                      child: const Text('QR scan')),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      qrCheck();
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text('qrcheck'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Scan result : $_scanQR\n',
                      style: const TextStyle(fontSize: 20))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
