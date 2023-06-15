import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/pageterakhir.dart';
import 'rentmobil.dart';
import 'listmobil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart' as data;

class transfercar extends StatelessWidget {
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
      body: ListView(children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Container(
          width: double.infinity,
          height: 200,
          child: Image.asset('./aset/images/key.png'),
        ),
        new Text("Bank Transfer Method",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(58, 103, 187, 1))),
        new Padding(
          padding: new EdgeInsets.only(bottom: 5),
        ),
        Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return rent_mobil();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          '7812000000007683649',
                          style: TextStyle(fontSize: 15),
                        )),
                    margin: const EdgeInsets.only(top: 16),
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 216, 43, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          datapesanan();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return pageterakhir();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Selesai',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                    margin: const EdgeInsets.only(top: 16),
                    width: 300,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(58, 103, 187, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
