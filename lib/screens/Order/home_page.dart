import 'package:first_app/screens/Order/advertise.dart';
import 'package:first_app/screens/Order/custom_widgets/basicPadding.dart';
import 'package:first_app/screens/Order/custom_widgets/services_card.dart';
import 'package:first_app/screens/Order/events.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/home/more_events.dart';
import 'package:first_app/screens/Order/appServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {



  Widget latestEventText(){
    return Text("Latest Events.",
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: latestEventText()),
                    BasicPadding(),
                    Events(),

                  ],
                ),
              ),
              Card(
                  elevation: 10.0,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: servicesText()
                        ),
                      AppServices(),
                    ],
                  )
              ),

              Advertise(),
            ],
          ),
        ),
      ),
    );
  }

  Widget servicesText() {
    return Text("Services ...",
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }
}
