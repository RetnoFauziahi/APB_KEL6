import 'dart:ui';
import 'package:flutter/material.dart';
import 'pages/listmobil.dart';
import 'pages/pagetesting.dart';
import 'pages/pagehome.dart';
import 'pages/pageterakhir.dart';
import 'pages/afterlogin.dart';
import 'pages/transfercar.dart';
import 'pages/scancar.dart';
import 'pages/rentmotor.dart';
import 'pages/openstreet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOATRIP!',
      debugShowCheckedModeBanner: false,
      // home: pageterakhir(),
      home: homepages(),
      // home: rent_motor(),
    );
  }
}
