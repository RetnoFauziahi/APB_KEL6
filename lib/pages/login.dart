import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:tubesgabungan/pages/afterlogin.dart';
import 'signup.dart';
import 'listmobil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart' as data;
String test = "";
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
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
            controller: _passwordController,
            obscureText: true,
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

class _LoginScreenState extends State<LoginScreen> {

  final String email = _emailController.text;
  final String username = _usernameController.text;
  final String password = _passwordController.text;
  final CollectionReference _user =
  FirebaseFirestore.instance.collection('user');
  Future<void> _read() async { //ini kodingan create

    final akun_user = FirebaseFirestore.instance.collection('user').where('email', isEqualTo: email).limit(1).snapshots();
    StreamBuilder<QuerySnapshot>(
      stream: akun_user,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          final account = streamSnapshot.data!.docs;
          if (account.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Email tidak terdaftar'),
            ));
          } else {
            if (account[0]['password'] != password) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Password yang Anda masukkan salah'),
              ));
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => afterlogin()),
              );
            }
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 120.0,
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
                              'Login',
                              style: TextStyle(
                                  color: Color(0xff0B2447),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 50),
                            buildEmail(),
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
                                                SignUpScreen()));
                                  },
                                  child: Text('Create an account')),
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
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFF0B2447))),
                                    onPressed: () {


                                      bool emailNotFound = true;
                                      FirebaseFirestore.instance.collection('user').where('email', isEqualTo: _emailController.text).limit(1).get().then((QuerySnapshot querySnapshot){
                                        querySnapshot.docs.forEach((doc){
                                          if (doc.get('email') == '') {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text('Email tidak terdaftar 1233'),

                                            ));
                                          } else {
                                            emailNotFound = false;
                                            if (doc.get('password') != _passwordController.text) {
                                              emailNotFound = false;
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                content: Text('Password yang Anda masukkan salah'),
                                              ));
                                            } else {

                                              emailNotFound = false;
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => afterlogin()),
                                              );
                                            }
                                          }
                                        });
                                        if (emailNotFound == true){
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text('email atau password salah !')
                                          ));}
                                        data.email = _emailController.text;
                                        _emailController.text='';
                                        _passwordController.text='';

                                        }


                                      );
                                    },
                                    child: new Text('Login',
                                        style: new TextStyle(
                                          fontSize: 20,
                                        ))),
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
