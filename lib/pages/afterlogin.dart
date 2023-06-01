import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tubesgabungan/pages/listmobil.dart';
import 'package:tubesgabungan/pages/listmotor.dart';
import 'pagehome.dart';
import 'login.dart' as login;
import 'data.dart' as data;

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
  // final String email = data.email;
  // final _afterlogin1 = FirebaseFirestore.instance.collection('user').where('email', isEqualTo: email).limit(1).get();
  final String email = data.email;
  final _afterlogin1 = FirebaseFirestore.instance.collection('user').where('email', isEqualTo: data.email).limit(1).snapshots();



  final List<String> fotomobil = [
    "./aset/images/Lamborghini_Aventador_S.png",
    "./aset/images/Ferarri_458.png",
    "./aset/images/Rolls_Royce_Phantom.png"
  ];
  final List<String> fotomotor = [
    "./aset/images/BMW_R1200_GS.png",
    "./aset/images/KawasakiH2.png",
    "./aset/images/bmwgede.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFA5D7E8),
        elevation: 0,
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
                            return homepages();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(245, 1, 5, 3),
                  width: 70,
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
      body: Container(
        color: Color(0xFFA5D7E8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('./aset/images/logo.png'),
                  ),
                  SizedBox(width: 16),
                    StreamBuilder(
                    stream: _afterlogin1,
                    builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                    final data = streamSnapshot.data!.docs;
                    return Text(
                      "Welcome " +data[0]['username'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                    }return const Center(
                      child: CircularProgressIndicator(),
                    );},
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fotomobil.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(fotomobil[index]),
                            ),
                          ),
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
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fotomotor.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(fotomotor[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => list_motor()));
                      },
                      child: Text('Rent Superbikes'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
