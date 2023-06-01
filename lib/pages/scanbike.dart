import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/rentmotor.dart';
import 'package:tubesgabungan/pages/pageterakhir.dart';
import 'rentmobil.dart';
import 'listmobil.dart';

class scanbike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Color(0xFFA5D7E8),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              './aset/images/logo.png',
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
            Text("GOATRIP!",
                style: TextStyle(
                    wordSpacing: 2,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19376D))),
          ],
        ),
      ),
      backgroundColor: Color(0xFFA5D7E8),
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
                          color: Color.fromRGBO(246, 252, 255, 1),
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
                        children: [
                          Image.asset(
                            './aset/images/barcode.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return rent_motor();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Done',
                              style: TextStyle(fontSize: 15),
                            )),
                        margin: const EdgeInsets.only(),
                        width: 60,
                        height: 25,
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
            SizedBox(
              height: 200,
            ),
            Container(
              child: Text(
                "Dengan masuk atau daftar ke aplikasi ini berarti kamu menyetujui ketentuan layanan dan kebijakan kami",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          ]),
    );
  }
}
