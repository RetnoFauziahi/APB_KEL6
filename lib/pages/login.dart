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
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
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
          height: 60,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Color.fromRGBO(58, 103, 187, 1)),
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
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
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
          height: 60,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(58, 103, 187, 1)),
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white),
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
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: 200,
                              child: Image.asset('./aset/images/key.png'),
                            ),
                            SizedBox(height: 10),
                            buildEmail(),
                            SizedBox(height: 20),
                            buildPassword(),
                            SizedBox(height: 30),
                            Container(
                              width: 370,
                              height: 60,
                              child: ClipRRect(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(58, 103, 187, 1))),
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
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(0),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()
                                      )
                                    );
                                  },
                                  child: Text("Don't have an Account ? Sign Up",
                                  style: TextStyle(
                                    color: Color.fromRGBO(58, 103, 187, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))),
              ],
            ),
          )),
    );
  }
}
