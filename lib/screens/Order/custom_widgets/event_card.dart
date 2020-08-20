import 'package:first_app/screens/Order/styles/global_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventList {
  EventList({this.eventName, this.description});
  final String eventName;
  final String description;
}

class EventCard extends StatelessWidget {
  int data;
  EventCard(int i){
    this.data=i;
    //print(this.data);
  }

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
    return Container(
      height: 160.0,
      child: ListView.separated(
          itemCount: (data==2) ? 2 : allEvents.length,
          itemBuilder: (context, index) {
            return  ListTile(
              title: Text(allEvents[index].eventName,
                style: TextStyle(
                    fontSize: 15.0,
                    color: GlobalStyles.secondaryColor,
                    fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(Icons.event_available,size: 50.0,),
              subtitle: Text(allEvents[index].description,
                style: TextStyle(
                  fontSize: 15.0,
                  color: GlobalStyles.secondaryColor,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                size: 30.0,
                color: GlobalStyles.secondaryColor,
              ),
            );
          },
        separatorBuilder: (context,index){
            return Divider(
              thickness: 2.0,
              indent: 15,
              endIndent: 15,
              color: GlobalStyles.dividerColor,
            );
        },

      ),
    );
  }

}


