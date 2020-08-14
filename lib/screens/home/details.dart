import 'file:///E:/flutterApps/first_app/lib/screens/home/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Details extends StatefulWidget {
  String value;
  Details({Key key,@required this.value}) : super(key : key);



  @override
  _DetailsState createState() => _DetailsState(value: value);
}

class _DetailsState extends State<Details> {
  String value;
  _DetailsState({this.value});
  int _value = 1;


  @override
  Widget build(BuildContext context) {
    print(value);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Appointment Details"),
        centerTitle: true,
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/details.jpg"),
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: new Form(
              child:new Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintText: "Enter Username",
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.text,

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      SizedBox(
                        width: 180.0,
                        height: 100.0,
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintText: "Phone",
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.text,

                          ),
                        ),
                      ),
                      SizedBox(
                        width: 190.0,
                        height: 100.0,

                        child: Container(

                            padding: EdgeInsets.all(20.0),
                            child: DropdownButtonFormField(
                                decoration: new InputDecoration(
                                  filled: true,
                                  focusColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),

                                  ),

                                  fillColor: Colors.white,
                                ),

                                value: _value,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("+91"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("+84"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("+1"),
                                    value: 3,
                                  ),
                                ], onChanged: (value){
                              setState(() {
                                _value=value;
                              });
                            })
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.location_on),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintText: "Address",
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.text,

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.location_on),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintText: "City",
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.text,

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      SizedBox(
                        width: 190.0,
                        height: 100.0,

                        child: Center(
                          child: Container(

                              padding: EdgeInsets.all(10.0),
                              child: DropdownButtonFormField(

                                  decoration: new InputDecoration(
                                    filled: true,
                                    focusColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),

                                    fillColor: Colors.white,
                                  ),

                                  value: _value,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("UP"),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("MP"),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Delhi"),
                                      value: 3,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Haryana"),
                                      value: 4,
                                    ),
                                  ], onChanged: (value){
                                setState(() {
                                  _value=value;
                                });
                              })
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180.0,
                        height: 100.0,

                        child: Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: new InputDecoration(

                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintText: "Zip",
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.text,

                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintText: "Email",
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text("Appointment Date",
                      style:TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(value,
                      style:TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    height: 60.0,
                    minWidth: 250.0,
                    color: Colors.green,
                    splashColor: Colors.teal,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Products()),
                      );

                    },
                    child: Text("Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}