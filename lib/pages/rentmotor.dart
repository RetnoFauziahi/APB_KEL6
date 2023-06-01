import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/pageterakhir.dart';
import 'package:tubesgabungan/pages/scanbike.dart';
import 'package:tubesgabungan/pages/transferbike.dart';
import 'listmobil.dart';

class rent_motor extends StatelessWidget {
  // bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120.0,

          backgroundColor: Color(0xFFA5D7E8),
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
            ],
          ),
        ),
        backgroundColor: Color(0xFFA5D7E8),
        body: ListView(children: <Widget>[
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  child: Center(
                      child: Text("Motor", style: TextStyle(fontSize: 12))),
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
          Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              width: 450,
              height: 650,
              decoration: BoxDecoration(
                color: Color.fromARGB(128, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        './aset/images/KawasakiH2.png',
                        width: 150,
                        height: 100,
                      ),
                      Text(
                        "Kawasaki Ninja H2 Carbon",
                        style: TextStyle(
                            wordSpacing: 3,
                            letterSpacing: 2,
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Center(
                            child: Text("Rp.--------,-/Day",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))),
                        margin: const EdgeInsets.fromLTRB(200, 2, 1, 5),
                        width: 130,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 115, 23),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    Container(
                      child: Center(
                          child: Text("DD/MM/YY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))),
                      margin: const EdgeInsets.all(8),
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <Widget>[
                        Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ],
                    ),
                    Container(
                      child: Center(
                          child: Text("DD/MM/YY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))),
                      margin: const EdgeInsets.all(8),
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ]),
                  // Row(
                  //   children: <Widget>[
                  //     Checkbox(
                  //       value: isCheck,
                  //       onChanged: (bool value) {
                  //         setState(() {
                  //           isCheck = value;
                  //         });
                  //       },
                  //     ),
                  //     Text("Driver"),
                  //   ],
                  // ),
                  SizedBox(
                    width: 15,
                    height: 15,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 590,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.only(
                            left: 10, bottom: 20, right: 20, top: 10),
                        child: Text(
                          "Order Summary\n"
                          "\n"
                          "Subtotal                                                                         Rp.00000\n"

                          "Total                                                                               Rp.00000",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 590,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, bottom: 5, right: 20, top: 10),
                              child: Text(
                                "Payment Method",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.asset("./aset/images/bank.png"),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                transferbike()),
                                      );
                                    },
                                    child: Text(
                                      "Bank Transfer",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.asset("./aset/images/cod.png"),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => scanbike()),
                                      );
                                    },
                                    child: Text(
                                      "QRIS",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 2, right: 10, top: 1),
                        child: Text(
                          "Note\n"
                          "1. Penyewa wajib menyerahkan fotocopy KTP ketika mengambil kendaraan.\n"
                          "2. Pengemudi kendaraan rental harus memiliki surat izin mengemudi (SIM).\n"
                          "3. Rental dihitung selama 24 jam mulai dari waktu pengambilan kendaraan.\n"
                          "4. Harga yang tercantum belum termasuk bensin.\n"
                          "5. Sebelum kendaraan diserahkan kepada penyewa, kendaraan sudah mendapatkan perawatan, pemeriksaan mesin dan body.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 10, bottom: 0, right: 5, top: 1),
                          child: Text(
                            "(jika terjadi kerusakan mesin atau body kendaraan setelah pemakaian maka penyewa diharuskan membayar sesuai dengan harga kerusakan)",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 196, 17, 17),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: 50,
                        height: 50,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 180, bottom: 5, right: 10, top: 10),
                            child: Text(
                              "Rp................",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            child: TextButton(
                              style:
                                  TextButton.styleFrom(primary: Colors.black),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return pageterakhir();
                                    },
                                  ),
                                );
                              },
                              child: const Text('Rent'),
                            ),
                            width: 80,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 115, 23),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                "Dengan masuk atau daftar ke aplikasi ini berarti kamu menyetujui ketentuan layanan dan kebijakan kami",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            )
          ])
        ]));
  }
}
