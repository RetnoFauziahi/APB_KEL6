import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/afterlogin.dart';
import 'package:tubesgabungan/pages/listmobil.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
final TextEditingController _emailController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Email",
        style: TextStyle(
            color: Color(0xff0B2447),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Color(0xff0B2447)),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black45)),
          ))
    ],
  );
}

Widget buildUsername() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Username",
        style: TextStyle(
            color: Color(0xff0B2447),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.people, color: Color(0xff0B2447)),
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.black45)),
          ))
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Password",
        style: TextStyle(
            color: Color(0xff0B2447),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            controller: _passwordController,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xff0B2447)),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black45)),
          ))
    ],
  );
}

class _SignUpScreenState extends State<SignUpScreen> {
  final CollectionReference _user =
  FirebaseFirestore.instance.collection('user');
  Future<void> _create() async { //ini kodingan create
    final String email = _emailController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    await _user.add({"email": email, "username": username, "password" : password});

    _emailController.text = '';
    _usernameController.text = '';
    _passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 120.0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                './aset/images/logo.png',
                width: 65,
                height: 65,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topLeft,
              ),
            ],
          )),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xffA5D7E8),
                          Color(0xffA5D7E8),
                          Color(0xffA5D7E8),
                          Color(0xffA5D7E8),
                        ])),
                    child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color(0xff0B2447),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 50),
                            buildEmail(),
                            SizedBox(height: 20),
                            buildUsername(),
                            SizedBox(height: 20),
                            buildPassword(),
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.all(0),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text('Already have account?')),
                            ),
                            SizedBox(height: 40),
                            Container(
                              width: 200,
                              height: 55,
                              child: ClipRRect(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF0B2447)),
                                  ),
                                  onPressed: () {
                                    _create();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => afterlogin()),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 100),
                            Container(
                              child: Text(
                                "Dengan masuk atau daftar ke aplikasi ini berarti kamu menyetujui ketentuan layanan dan kebijakan kami",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          )),
    );
  }
}
