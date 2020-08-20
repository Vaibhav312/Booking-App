import 'package:first_app/screens/authenticate/signup.dart';
import 'package:first_app/screens/loading.dart';
import 'package:first_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/flutterApps/first_app/lib/screens/home/products.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  var email="";
  String emailValue;
  String passwordValue;
  String error='';
  bool loading=false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _auth= AuthService();


  Widget _emailField(){
    return TextFormField(
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintText: "Enter email",
        fillColor: Colors.white,
      ),
      validator: (String value){
        if(value.isEmpty){
          return "Email is Required";
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (String value) {
        emailValue = value;
      },
      onChanged: (data){
        setState(() {
          email=data;

        });
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
  Widget _passwordField(){
    return TextFormField(
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintText: "Enter Password",
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (String value){
        if(value.isEmpty){
          return "Password is Required";
        }
        /*   if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
       return '''Password should be 8 charcaters long and it contains:
                             Minimum 1 Upper case
                             Minimum 1 lowercase
                             Minimum 1 Numeric Number
                             Minimum 1 Special Character''';

     }*/
        return null;

      },
      onSaved: (String value) {
        passwordValue = value;
      },
    );
  }
  Widget _padding(){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
    );
  }
  Widget _submitButton(){
    return  MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      height: 50.0,
      minWidth: 500.0,
      color: Colors.green,
      splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Sign In"),
      onPressed: () async{
        if(!_formKey.currentState.validate()){
          return;
        }
        setState(() {
          loading=true;
        });
        _formKey.currentState.save();
        dynamic result= await _auth.signWithEmailAndPasssword(emailValue, passwordValue);

        if (result==null){
          setState(() {

            error='Could not Sign in with those credentials';
            loading=false;
          });
        }
        else{
          //print('signed in');
          Navigator.pushReplacement(
            context,
            // MaterialPageRoute(builder: (context) => Products(value: emailValue)),
            MaterialPageRoute(builder: (context) => Products()),
          );
          // print(result.uid);
        }


      },
    );
  }
  Widget _registerButton(){
    return  MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      color: Colors.green,
      splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Sign Up"),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(

      appBar: new AppBar(
        title: new Text("Login",
          style:TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/reset.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(30.0),
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new SizedBox(
                  width: double.infinity,
                  child: Container(

                    child: new Text("Welcome",
                      textAlign: TextAlign.left,
                      style:TextStyle(fontSize: 50,
                        color: Colors.blueGrey,),
                    ),
                  ),
                ),
                new SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: new Text("Back",
                      textAlign: TextAlign.left,
                      style:TextStyle(fontSize: 50,
                        color: Colors.blueGrey,),
                    ),
                  ),
                ),
                new Form(
                    key: _formKey,
                    child: new Column
                      (
                      children: [
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        _emailField(),
                        _padding(),
                        _passwordField(),
                        _padding(),
                        _submitButton(),
                        _padding(),
                        Text(error,
                          style: TextStyle(color: Colors.red,fontSize: 16.0,fontWeight: FontWeight.bold),
                        ),
                        Divider(color: Colors.black,),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Create Account",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                _registerButton(),

                              ],),
                          ),
                        ),
                        SizedBox(height: 12.0),

                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}