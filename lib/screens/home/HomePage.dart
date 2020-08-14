import 'package:flutter/material.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/authenticate/login.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/authenticate/signup.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/main.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new AssetImage(
                                "assets/logo.jpeg")
                        )
                    ),
                  ),
                  Container(

                    child: Text("Delivery App",style: TextStyle(
                      fontSize: 40.0,
                    ),
                    ),

                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 80.0),
                    child: Text("We deliever our item in 30 minutes",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),

                  SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: RaisedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                      child: Text("Log In"),
                      color: Colors.green,
                      splashColor: Colors.teal,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: RaisedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                      child: Text("Sign Up"),
                      color: Colors.green,
                      splashColor: Colors.teal,
                      textColor: Colors.white,
                    ),

                  ),

                ],
              ),
        )


      ),
    );
  }
}