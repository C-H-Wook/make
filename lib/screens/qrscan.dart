import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:makertone_proto_one/utilities/color.dart';

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
            body: Builder(builder: (BuildContext context) {
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
                        Text('Scan result : $_scanQR\n',
                            style: const TextStyle(fontSize: 20))
                      ]));
            })));
  }
}
