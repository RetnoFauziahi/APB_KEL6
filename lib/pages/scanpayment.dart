import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/backup.dart';
import 'package:tubesgabungan/pages/rentmotor.dart';
import 'package:tubesgabungan/pages/pageterakhir.dart';
import 'rentmobil.dart';
import 'listmobil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart' as data;
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(new scanbike());
}

class scanbike extends StatefulWidget {
  @override
  _scanbike createState() => new _scanbike();
}

class _scanbike extends State<scanbike> {
  final GlobalKey qrKey = GlobalKey();
  String barcode = "";
final CollectionReference _pesanan =
      FirebaseFirestore.instance.collection('list_pesanan');
  void datapesanan() {
    FirebaseFirestore.instance
        .collection('list_pesanan')
        .where("email", isEqualTo: data.email)
        .limit(1)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        Map<dynamic, dynamic> produk = {
          "jenis_kendaraan": data.jenis_kendaraan,
          "tanggal_awal": data.tanggal_awal,
          "tanggal_akhir": data.tanggal_akhir,
          "total_harga": data.total_harga // Replace with the actual value
        };
        _pesanan.doc(docSnapshot.id).update({
          "email": docSnapshot.data()['email'],
          "Lpesanan": FieldValue.arrayUnion([produk])
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          // color : Color(0xFFA5D7E8),
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(30.0),
            ),
            new Padding(
              padding: new EdgeInsets.all(15),
            ),
            Positioned(
                top: 10,
                height: 10,
                child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 10, bottom: 10),
                          child: Text(
                            'Scan Barcode',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Column(
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 60, right: 60, top: 0, bottom: 0),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFF19376D),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                        ],
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {
                              datapesanan();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return page_terakhir();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Selesai',
                              style: TextStyle(fontSize: 15),
                            )),
                        margin: const EdgeInsets.only(),
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 229, 177, 21),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ])
                  ],
                ),
              ],
            ),
          ]),
    );
  }
}