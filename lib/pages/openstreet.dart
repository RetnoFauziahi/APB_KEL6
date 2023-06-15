import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'sqflite.dart';


class OpenStreet extends StatefulWidget {
  const OpenStreet({super.key});

  @override
  State<OpenStreet> createState() => OpenStreetState();
}

class OpenStreetState extends State<OpenStreet> {
  String locationaddress = "Pick location";
  double latitude = 23, longitude = 90;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              '/images/logo.png',
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
            Text("LuxRide!",
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ListView(
          // color : Color(0xFFA5D7E8),
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(20.0),
            ),
            new Text("Lokasi Pengambilan\n(Gerai LuxRide)",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19376D))),
            new Padding(
              padding: new EdgeInsets.all(150),
            ),
            ElevatedButton(
              onPressed: () {
                _showModal(context);
              },
              child: Text(locationaddress),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 100,
            ),
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

  void _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 600,
            color: Colors.red,
            child: Center(
              child: OpenStreetMapSearchAndPick(
                  center: LatLong(latitude, longitude),
                  buttonColor: Colors.blue,
                  buttonText: 'Set Current Location',
                  onPicked: (pickedData) {
                    Navigator.pop(context); //pop modal button sheet
                    setState(() {
                      locationaddress = pickedData.address;
                      latitude = pickedData.latLong.latitude;
                      longitude = pickedData.latLong.longitude;
                    });
                  }),
            ),
          );
        });
  }
}
