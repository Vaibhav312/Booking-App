import 'package:flutter/material.dart';

class EventList {
  EventList({this.eventName, this.description});
  final String eventName;
  final String description;


}


class MoreEvents extends StatelessWidget {

  List<EventList> allEvents = [
    EventList(eventName: 'Transformation Series 2020', description: 'Connaught Place'),
    EventList(eventName: 'Comedy Club of India 2020', description: 'Connaught Place'),
    EventList(eventName: 'Transformation Series 2020', description: 'Delhi'),
    EventList(eventName: 'Comedy Club of India 2020', description: 'Agra'),
    EventList(eventName: 'Transformation Series 2020', description: 'Mumbai'),
    EventList(eventName: 'Comedy Club of India 2020', description: 'Haryana'),
    EventList(eventName: 'Transformation Series 2020', description: 'Gurgaon'),
    EventList(eventName: 'Comedy Club of India 2020', description: 'Jaipur'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Events'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        child: ListView.builder(
            itemCount: allEvents.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.event_available,size: 60.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(allEvents[index].eventName,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(allEvents[index].description,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black87,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

