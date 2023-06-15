import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tubesgabungan/pages/listmobil.dart';
import 'package:tubesgabungan/pages/listmotor.dart';
import 'package:tubesgabungan/pages/sqflite.dart';
import 'pagehome.dart';
import 'pageuser.dart';
import 'login.dart' as login;
import 'data.dart' as data;
import 'sqflite.dart';


void main() async {
  runApp(const after_login());
}

class after_login extends StatelessWidget {
  const after_login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'After_login',
      home: afterlogin(),
    );
  }
}

class afterlogin extends StatefulWidget {
  afterlogin({Key? key}) : super(key: key);
  @override
  State<afterlogin> createState() => _afterlogin();
}

class _afterlogin extends State<afterlogin> {
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
  // final String email = data.email;
  // final _afterlogin1 = FirebaseFirestore.instance.collection('user').where('email', isEqualTo: email).limit(1).get();
  final String email = data.email;
  final _afterlogin1 = FirebaseFirestore.instance
      .collection('user')
      .where('email', isEqualTo: data.email)
      .limit(1)
      .snapshots();

  final fotomobil1 =
      FirebaseFirestore.instance.collection('list_mobil').snapshots();
  final fotomotor1 =
      FirebaseFirestore.instance.collection('list_motor').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
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
              margin: EdgeInsets.only(top: 50, bottom: 16, right: 16, left: 16),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  StreamBuilder(
                    stream: _afterlogin1,
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        final data = streamSnapshot.data!.docs;
                        return Text(
                          "Welcome " + data[0]['username'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => list_cabang()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(58, 80, 80, 1),
                ),
                child: Text('List Cabang'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Container(
                    height: 300,
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
                    child: StreamBuilder(
                      stream: fotomobil1,
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          final data3 = streamSnapshot.data!.docs;
                          return PageView.builder(
                            physics: PageScrollPhysics(),
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return Image(
                                image: NetworkImage(documentSnapshot['gambar']),
                                width: 150,
                                height: 100,
                                fit: BoxFit.contain,
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => listmobil()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(58, 103, 187, 1),
                      ),
                      child: Text('Rent Cars'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Container(
                    height: 300,
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
                    child: StreamBuilder(
                      stream: fotomotor1,
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          final data3 = streamSnapshot.data!.docs;
                          return PageView.builder(
                            physics: PageScrollPhysics(),
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return Image(
                                image: NetworkImage(documentSnapshot['gambar']),
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => listmotor()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(58, 103, 187, 1),
                      ),
                      child: Text('Rent Bike'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
