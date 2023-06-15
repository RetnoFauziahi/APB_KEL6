import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/login.dart';
import 'package:tubesgabungan/pages/signup.dart';
import 'listmobil.dart';

import 'package:flutter/material.dart';
import 'package:tubesgabungan/pages/login.dart';
import 'package:tubesgabungan/pages/signup.dart';

class homepages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context), // Tambahkan context sebagai parameter
    );
  }

  Widget content(BuildContext context) { // Tambahkan context sebagai parameter
    return Column(
      children: [
        SizedBox(
          height: 170,
        ),
        Text(
          "Welcome to LuxRide",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 300,
          child: Image.asset('./aset/images/logo1.png'),
        ),
        SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: () {
            // Navigasi ke halaman Sign Up
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(), // Ganti SignUpPage dengan halaman SignUp yang ingin dituju
              ),
            );
          },
          child: Container(
            height: 60,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Color.fromRGBO(58, 103, 187, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            // Navigasi ke halaman Login
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(), // Ganti LoginPage dengan halaman Login yang ingin dituju
              ),
            );
          },
          child: Container(
            height: 60,
            width: 350,
            decoration: BoxDecoration(
              color: Color.fromRGBO(58, 103, 187, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Text('Sign Up Page'),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: homepages(),
  ));
}
