import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tubesgabungan/pages/afterlogin.dart';
import 'package:tubesgabungan/pages/listmobil.dart';
import 'rentmotor.dart';
import 'pagehome.dart';
import 'pageuser.dart';
import 'login.dart' as login;
import 'afterlogin.dart';
import 'data.dart' as data;

void main() async {
  runApp(const listmotor());
}

class listmotor extends StatelessWidget {
  const listmotor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'list_motor',
      home: list_motor(),
    );
  }
}

class list_motor extends StatefulWidget {
  list_motor({Key? key}) : super(key: key);
  @override
  State<list_motor> createState() => _list_motor();
}

class _list_motor extends State<list_motor> {
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
  final fotomotor1 =
      FirebaseFirestore.instance.collection('list_motor').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(

          // color : Color(0xFFA5D7E8),
          children: [
            Row(children: [
              Container(
                child: TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return listmobil();
                          },
                        ),
                      );
                    },
                    child: Text('Mobil', style: TextStyle(fontSize: 12))),
                margin: const EdgeInsets.all(10),
                width: 78,
                height: 30,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 216, 43, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ]),
            StreamBuilder(
              stream: fotomotor1,
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  final data_motor = streamSnapshot.data!.docs;
                  return Column(
                    children: [
                      for (var i = 0;
                          i < streamSnapshot.data!.docs.length;
                          i++) ...[
                        Container(
                          margin: const EdgeInsets.all(8),
                          width: 450,
                          height: 250,
                          decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(data_motor[i]['gambar']),
                                width: 150,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10),
                              Text(
                                data_motor[i]['jenis_kendaraan'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  wordSpacing: 3,
                                  letterSpacing: 2,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 110,
                                    height: 31,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(248, 216, 43, 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Rp." +
                                            data_motor[i]['harga'].toString() +
                                            " / Day",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 90,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(248, 216, 43, 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.black),
                                      onPressed: () {
                                        data.jenis_kendaraan =
                                            data_motor[i]['jenis_kendaraan'];
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return rent_motor();
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Rent',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ]),
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
