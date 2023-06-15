import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/afterlogin.dart';
import 'pagehome.dart';
import 'pageuser.dart';
import 'data.dart' as data;

void main() async {
  runApp(const page_terakhir());
}

class page_terakhir extends StatelessWidget {
  const page_terakhir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pageterakhir',
      home: pageterakhir(),
    );
  }
}

class pageterakhir extends StatefulWidget {
  pageterakhir({Key? key}) : super(key: key);
  @override
  State<pageterakhir> createState() => _pageterakhir();
}

class _pageterakhir extends State<pageterakhir> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
   if (index==0){
    _selectedIndex = 0;
    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return afterlogin();
                      },
                    ),
    );

   }else if (index==1){
    _selectedIndex = 1;
    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return pageUser();
                      },
                    ),
);}
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Container(
          width: double.infinity,
          height: 200,
          child: Image.asset('./aset/images/key.png'),
        ),
        new Text("Booking Success!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(58, 103, 187, 1))),
        new Padding(
          padding: new EdgeInsets.only(bottom: 5),
        ),
        Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: [
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
                        child: Text(
                          'Jenis Kendaraan :'+data.jenis_kendaraan,
                          style: TextStyle(fontSize: 15),
                        )),
                    margin: const EdgeInsets.only(top: 16),
                    width: 300,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 216, 43, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ]),
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
                        child:  Text(
                          'Lama Booking :'+data.lama_booking.toString()+' hari',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                    margin: const EdgeInsets.only(top: 16),
                    width: 300,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(58, 103, 187, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ]),
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
                          'Kembali Ke Home',
                          style: TextStyle(fontSize: 15),
                        )),
                    margin: const EdgeInsets.only(top: 16),
                    width: 300,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 216, 43, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ])
              ],
            ),
          ],
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
        ],
      ),
    );
  }
}
