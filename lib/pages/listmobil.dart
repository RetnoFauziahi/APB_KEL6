import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/afterlogin.dart';
import 'rentmobil.dart';
import 'listmotor.dart';
import 'pagehome.dart';

class listmobil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120.0,
          backgroundColor: Color(0xFFA5D7E8),
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                './aset/images/logo.png',
                width: 65,
                height: 65,
                fit: BoxFit.contain,
              ),
              Text("GOATRIP!",
                  style: TextStyle(
                      wordSpacing: 3,
                      letterSpacing: 2,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF19376D))),
              Row(
                children: [
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return afterlogin();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Home Page",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(240, 1, 5, 3),
                    width: 78,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 134, 8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Color(0xFFA5D7E8),
        body: ListView(

            // color : Color(0xFFA5D7E8),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      child: Center(
                          child: Text("Mobil", style: TextStyle(fontSize: 12))),
                      margin: const EdgeInsets.all(8),
                      width: 78,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return list_motor();
                              },
                            ),
                          );
                        },
                        child: const Text('Motor'),
                      ),
                      margin: const EdgeInsets.all(8),
                      width: 78,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ]),
                ],
              ),
              Column(
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    children: [
                      for (var i = 0; i < 8; i++) ...[
                        Container(
                            margin: const EdgeInsets.all(8),
                            width: 450,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(128, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      './aset/images/Lamborghini_Aventador_S.png',
                                      width: 150,
                                      height: 100,
                                    ),
                                    Text(
                                      "Lamborghini Aventador S",
                                      style: TextStyle(
                                          wordSpacing: 3,
                                          letterSpacing: 2,
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  Container(
                                    child: Center(
                                        child: Text("Rp. /Day",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12))),
                                    margin:
                                        const EdgeInsets.fromLTRB(140, 2, 2, 3),
                                    width: 110,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 243, 60, 23),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.black),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return rent_mobil();
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text('Rent'),
                                    ),
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 2, 2, 3),
                                    width: 80,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 243, 60, 23),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ])
                              ],
                            )),
                      ]
                    ],
                  ),
                ],
              ),
              Container(
                child: Text(
                  "Dengan masuk atau daftar ke aplikasi ini berarti kamu menyetujui ketentuan layanan dan kebijakan kami",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              )
            ]));
  }
}
