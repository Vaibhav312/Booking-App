import 'package:first_app/screens/Order/advertise.dart';
import 'package:first_app/screens/Order/business.dart';
import 'package:first_app/screens/Order/custom_widgets/basicPadding.dart';
import 'package:first_app/screens/Order/custom_widgets/componentPadding.dart';
import 'package:first_app/screens/Order/events.dart';
import 'package:first_app/screens/Order/appServices.dart';
import 'package:first_app/screens/Order/news.dart';
import 'package:first_app/screens/Order/styles/global_styles.dart';
import 'package:first_app/screens/Order/taxi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {

  Widget latestEventText(){
    return Text("Latest Events",
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: GlobalStyles.primaryColor,
      decoration: TextDecoration.underline,
      decorationColor: GlobalStyles.primaryColor,
      decorationStyle: TextDecorationStyle.solid,
    ),
    );
  }

  Widget servicesText() {
    return Text("Services",
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: GlobalStyles.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: GlobalStyles.primaryColor,
        decorationStyle: TextDecorationStyle.solid,
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
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 10.0,
                child: Column(
                  children: [
                    BasicPadding(),
                    Align(
                        alignment: Alignment.topCenter,
                        child: latestEventText()),
                    Events(),
                  ],
                ),
              ),
              ComponentPadding(),
              Advertise(),
              Card(
                  elevation: 10.0,
                  child: Column(
                    children: [
                      BasicPadding(),
                      Align(
                          alignment: Alignment.topCenter,
                          child: servicesText()
                        ),
                      AppServices(),
                    ],
                  )
              ),
              ComponentPadding(),
              News(),
              ComponentPadding(),
              Taxi(),
              ComponentPadding(),
              Business(),
              ComponentPadding(),
              Advertise(),
              ComponentPadding(),


            ],
          ),
        ),
      ),
    );
  }
}
