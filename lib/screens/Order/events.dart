import 'package:first_app/screens/Order/custom_widgets/event_card.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/home/more_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Events extends StatefulWidget {

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {

  Widget moreEventsButton(){
    return FlatButton(
      textColor: Colors.black54,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventCard(1)),
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "More Events >>",
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        child: Column(
          children: [
            EventCard(2),
            moreEventsButton()
          ],
        ),
      ),
    );
  }
}
