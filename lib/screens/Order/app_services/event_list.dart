import 'dart:core';

class EventList {
  EventList({this.eventName, this.description});
  final String eventName;
  final String description;

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

  List<EventList> getList()
  {
    return allEvents;
  }

}