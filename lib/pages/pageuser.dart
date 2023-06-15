import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tubesgabungan/pages/listmobil.dart';
import 'package:tubesgabungan/pages/listmotor.dart';
import 'pagehome.dart';
import 'pageuser.dart';
import 'afterlogin.dart';
import 'login.dart' as login;
import 'data.dart' as data;

void main() async {
  runApp(const page_user());
}

class page_user extends StatelessWidget {
  const page_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'page_user',
      home: pageUser(),
    );
  }
}

class pageUser extends StatefulWidget {
  pageUser({Key? key}) : super(key: key);
  @override
  State<pageUser> createState() => _pageUser();
}

class _pageUser extends State<pageUser> {
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

  final totalpesanan = FirebaseFirestore.instance
      .collection('list_pesanan')
      .where("email", isEqualTo: data.email)
      .limit(1)
      .snapshots();
  final TextEditingController _usernameController = TextEditingController();
  final _updatenama = FirebaseFirestore.instance.collection('user');
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    // Code for updating the user
    if (documentSnapshot != null) {
      _usernameController.text = documentSnapshot['username'];
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'username'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('update'),
                onPressed: () async {
                  final String username = _usernameController.text;
                  _updatenama.doc(documentSnapshot!.id).update({
                    "email": documentSnapshot['email'],
                    "username": username,
                    "password": documentSnapshot['password'],
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  final _afterlogin1 = FirebaseFirestore.instance
      .collection('user')
      .where('email', isEqualTo: data.email)
      .limit(1)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
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

  Widget content() {
    return Center(
      child: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          StreamBuilder(
            stream: _afterlogin1,
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                final data = streamSnapshot.data!.docs;
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[0];
                return Column(
                  children: [
                    daftarPesanan(data[0]['username'], false),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 12, 74, 230)),
                        onPressed: () {
                          print(documentSnapshot);
                          _update(documentSnapshot);
                        },
                        child: Text('Edit Profile',
                            style: TextStyle(fontSize: 12)),
                      ),
                      margin: const EdgeInsets.all(8),
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 12, 74, 230),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Pesanan",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          StreamBuilder(
              stream: totalpesanan,
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  final items = streamSnapshot.data!.docs;
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[0];
                  return ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16),
                      children: [
                        for (int i = items[0]['Lpesanan'].length - 1;
                            i >= 0;
                            i--) ...[
                          daftarPesanan(
                            "Nama Kendaraan " +
                                items[0]['Lpesanan'][i]['jenis_kendaraan'] +
                                "\n Tanggal Awal Peminjaman:" +
                                items[0]['Lpesanan'][i]['tanggal_awal'] +
                                "\n Tanggal Akhir Peminjaman:" +
                                items[0]['Lpesanan'][i]['tanggal_akhir'],
                            true,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ]
                      ]);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}

Widget daftarPesanan(String title, bool isPesanan) {
  return Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ],
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Posisi teks username diubah menjadi tengah
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: isPesanan ? FontWeight.normal : FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
