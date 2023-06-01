import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/afterlogin.dart';
import 'pagehome.dart';

class pageterakhir extends StatelessWidget {
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
            new Text("Booking Success \nGo On A Trip!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19376D))),
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
                            '-A57BNVU-',
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
                          Text(
                            ' Kamu berhasil membooking \n  Ferari 458 dengan No.POl: \n               D 2 NND\n\n    Ambil kendaraan sewa : \n   Jalan Buah Batu No 168',
                            style: TextStyle(
                              wordSpacing: 3,
                              letterSpacing: 2,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                './aset/images/Untitled_design__1_-removebg-preview.png',
                                width: 100,
                                height: 50,
                                fit: BoxFit.contain,
                              )
                            ],
                          )
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
                                    return afterlogin();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Home',
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

                    /*
                      
                      Positioned(
                        top: 10,
                        height:10,
                        child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                            Navigator.pop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Color.fromARGB(255, 229, 177, 21)
                             ),
                            child:Padding(
                                padding: const EdgeInsets.only(left: 10, right:10, top:3,bottom: 3),
                                child: Text('HOME', style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                             ),
                            ),
                          )
                        ],
                      )
                      ),*/
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 80,
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
