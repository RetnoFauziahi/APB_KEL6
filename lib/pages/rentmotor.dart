import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/pageterakhir.dart';
import 'package:tubesgabungan/pages/scancar.dart';
import 'package:tubesgabungan/pages/scanpayment.dart';
import 'package:tubesgabungan/pages/transferbike.dart';
import 'listmobil.dart';
import 'pageuser.dart';
import 'afterlogin.dart';
import 'login.dart' as login;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart' as data;

void main() async {
  runApp(const rentmotor1());
}

class rentmotor1 extends StatelessWidget {
  const rentmotor1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'rentmotor',
      home: rent_motor(),
    );
  }
}

class rent_motor extends StatefulWidget {
  rent_motor({Key? key}) : super(key: key);
  @override
  State<rent_motor> createState() => rentmotor();
}

class rentmotor extends State<rent_motor> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (index == 0) {
      _selectedIndex = 0;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return afterlogin();
          },
        ),
      );
    } else if (index == 1) {
      _selectedIndex = 1;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return pageUser();
          },
        ),
      );
    } else if (index == 2) {
      _selectedIndex = 2;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return login.LoginScreen();
          },
        ),
      );
    }
  }

  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        date1 = value!;
      });
    });
  }

  void _showDatePicker2() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        date2 = value!;
      });
    });
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  final datamotor = FirebaseFirestore.instance
      .collection('list_motor')
      .where("jenis_kendaraan", isEqualTo: data.jenis_kendaraan)
      .limit(1)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: StreamBuilder(
          stream: datamotor,
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              final motor = streamSnapshot.data!.docs;
              return ListView(children: [
                Column(children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 450,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(58, 103, 187, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: NetworkImage(motor[0]['gambar']),
                              width: 150,
                              height: 100,
                            ),
                            Text(
                              motor[0]['jenis_kendaraan'],
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
                                  child: Text(
                                      "Rp." +
                                          motor[0]['harga'].toString() +
                                          "/Day",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12))),
                              margin: const EdgeInsets.fromLTRB(200, 2, 1, 5),
                              width: 130,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(248, 216, 43, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          ],
                        ),
                        Row(children: [
                          Container(
                            child: Center(
                                child: ElevatedButton(
                              onPressed: _showDatePicker,
                              child: Text('Start'),
                            )),
                            margin: const EdgeInsets.all(8),
                            width: 100,
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const <Widget>[
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
                          ),
                          Container(
                            child: Center(
                              child: ElevatedButton(
                                onPressed: _showDatePicker2,
                                child: Text('End'),
                              ),
                            ),
                            margin: const EdgeInsets.all(8),
                            width: 100,
                            height: 20,
                          ),
                        ]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              width: 590,
                              height: 95,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(128, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.only(
                                  left: 0, bottom: 0, right: 0, top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    "Order Summary",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Start : " +
                                      date1.day.toString() +
                                      '-' +
                                      date1.month.toString() +
                                      '-' +
                                      date1.year.toString()),
                                  Text("End : " +
                                      date2.day.toString() +
                                      '-' +
                                      date2.month.toString() +
                                      '-' +
                                      date2.year.toString()),
                                  Text("Total days = " +
                                      daysBetween(date1, date2).toString()),
                                ],
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
                                        left: 10,
                                        bottom: 5,
                                        right: 20,
                                        top: 10),
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
                                            data.lama_booking = daysBetween(date1, date2);
                                            data.tanggal_awal = date1.day.toString() +
                                                                '-' +
                                                                date1.month.toString() +
                                                                '-' +
                                                                date1.year.toString();
                                            data.tanggal_akhir = date2.day.toString() +
                                                                '-' +
                                                                date2.month.toString() +
                                                                '-' +
                                                                date2.year.toString();
                                      data.total_harga = "Rp." +
                                        (motor[0]['harga'] *
                                                daysBetween(date1, date2))
                                            .toString();

                                              Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  
                                                      scanbike()),
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
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, bottom: 5, right: 10, top: 10),
                                  child: Text(
                                    " Total Total cost Rp." +
                                        (motor[0]['harga'] *
                                                daysBetween(date1, date2))
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ])
              ]);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_outlined),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
