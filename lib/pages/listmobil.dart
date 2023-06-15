import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/afterlogin.dart';
import 'rentmobil.dart';
import 'listmotor.dart';
import 'pagehome.dart';
import 'pageuser.dart';
import 'afterlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart' as login;
import 'data.dart' as data;

void main() async {
  runApp(const list_mobil());
}

class list_mobil extends StatelessWidget {
  const list_mobil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'list_mobil',
      home: list_mobil(),
    );
  }
}

class listmobil extends StatefulWidget {
  listmobil({Key? key}) : super(key: key);
  @override
  State<listmobil> createState() => _listmobil();
}

class _listmobil extends State<listmobil> {
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
  final fotomobil1 =
      FirebaseFirestore.instance.collection('list_mobil').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(children: [
        Row(children: [
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
                child: Text('Motor', style: TextStyle(fontSize: 12))),
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
          stream: fotomobil1,
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
                            width: 170,
                            height: 170,
                            fit: BoxFit.contain,
                          ),
                          
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
                                          return rent_mobil();
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
