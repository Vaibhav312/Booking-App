import 'package:flutter/material.dart';

class Advertise extends StatefulWidget {
  @override
  _AdvertiseState createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(

        height: 100.0,
         decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/advertise.jpg'),
            fit: BoxFit.fill,
          ),
        ),

      ),
    );
  }
}
