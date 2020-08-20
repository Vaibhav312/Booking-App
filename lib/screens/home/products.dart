import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/screens/Order/home_page.dart';
import 'package:first_app/screens/authenticate/login.dart';
import 'package:first_app/services/auth.dart';
import 'package:first_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/home/details.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/home/add_list.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/home/dropdown_form.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/home/week_view_events.dart';


class Products extends StatefulWidget {
  String value;
  Products({Key key,@required this.value}) : super(key : key);

  @override
  _ProductsState createState() => _ProductsState(value: value);
}

class _ProductsState extends State<Products> {


  String value;
  _ProductsState({this.value});
  CalendarController _calendarController;
  var data="";
  var formattedDate="";

  final AuthService _auth=AuthService();


  void _dateselect(var x){
    setState(() {
      data=x;

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    _calendarController=new CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    print(value);
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().notesStream,
      child: Scaffold(
        drawer:   Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '$value',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Calendar'),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Products())),
                },
              ),

              ListTile(
                leading: Icon(Icons.list),
                title: Text('Add List'),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddList())),
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_drop_down),
                title: Text('Dropdown'),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DropDown()))
                },
              ),


              ListTile(
                leading: Icon(Icons.view_week),
                title: Text('WeekViewEvents'),
                onTap: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>WeekViewEvents())),
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Logout'),
                onTap: () async {

                  await _auth.userSignOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Order'),
                onTap: ()  {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Order()));
                },
              ),

            ],
          ),
        ),
        appBar: AppBar(

          title: Text("Appointment Date"),

        ),
        body: SingleChildScrollView(
          child: Column(

            children: [

              TableCalendar(
                initialCalendarFormat: CalendarFormat.month,
                calendarController: _calendarController,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.orange,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Colors.white
                    )
                ),

                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,

                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date,events){
                  formattedDate = "${date.day}-${date.month}-${date.year}";
                  String x="hello";
                  _dateselect(formattedDate);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details(value : formattedDate)),
                  );
                },

              ),

            ],
          ),
        ),
      ),
    );
  }
}