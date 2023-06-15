import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(new cam());
}

class cam extends StatefulWidget {
  @override
  _cam createState() => new _cam();
}

class _cam extends State<cam> {
  final GlobalKey qrKey = GlobalKey();
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barcode Scanner Example'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  controller.scannedDataStream.listen((value) {
                    setState(() {
                      barcode = value.toString();
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Result: $barcode'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
