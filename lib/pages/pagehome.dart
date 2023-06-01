import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/login.dart';
import 'package:tubesgabungan/pages/signup.dart';
import 'listmobil.dart';

class homepages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFA5D7E8),
        elevation: 0,
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
              padding: new EdgeInsets.all(15.0),
            ),
            new Text("Hello, Welcome to \n Go On A Trip!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19376D))),
            new Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            new Image.asset(
              './aset/images/BMW_M4_GTS.png',
              width: 100,
              height: 85,
            ),
            new Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            new Image.asset(
              './aset/images/BMW_R1200_GS.png',
              width: 100,
              height: 95,
            ),
            new Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            new Text(
                "Memberikan pengalaman mahal dengan mengendarai \n mobil dan motor mewah \n Kendaraan kami, akan selalu setia menemani.\n Rental kendaraan mewah? GOATRIP aja!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10.0,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF19376D))),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  margin: const EdgeInsets.only(),
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF19376D),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  margin: const EdgeInsets.only(),
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF19376D),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
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
