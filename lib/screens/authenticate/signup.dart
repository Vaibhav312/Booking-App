import 'package:first_app/screens/authenticate/login.dart';
import 'package:first_app/screens/home/products.dart';
import 'package:first_app/screens/loading.dart';
import 'package:first_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _username;
  String _password;
  String _confirmPassword;
  String _email;
  bool loading=false;

  final TextEditingController _pass = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final AuthService _auth =AuthService();


  Widget _usernameField(){
    return TextFormField(
      decoration: new InputDecoration(
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
      validator: (String value){
        if(value.isEmpty){
          return "Email is Required";
        }
        if(value.length<=8){
          return "Username should be 8 characters long ";
        }
        return null;
      },
      onSaved: (String value){
        _username=value;
      },

    );
  }

  Widget _emailField(){
    return TextFormField(
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintText: "Enter Email",
        fillColor: Colors.white,
      ),
      validator: (String value){
        if(value.isEmpty){
          return "Email is required";
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (String value){
        _email=value;
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
      controller: _pass,
      keyboardType: TextInputType.text,
      validator: (String value){
        if(value.isEmpty){
          return "Password is Required";
        }
        /*if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
          return '''Password should be 8 charcaters long and it contains:
                             Minimum 1 Upper case
                             Minimum 1 lowercase
                             Minimum 1 Numeric Number
                             Minimum 1 Special Character''';

        }*/
        return null;
      },
      onSaved: (String value){
        _password=value;
      },
      obscureText: true,
    );
  }

  Widget _confirmPasswrodField(){
    return TextFormField(
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintText: "Confirm Password",
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (String value){
        if(value.isEmpty){
          return 'Required field is empty';
        }
        if(value!=_pass.text){
          return "Passsword and Confirm Password doesn't match";
        }
        return null;
      },
    );
  }

  Widget _submitButton(){
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      height: 50.0,
      minWidth: 150.0,
      color: Colors.green,
      splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Sign Up"),
      onPressed: () async{
        if(!_formKey.currentState.validate()){
          return;
        }
        setState(() {
          loading=true;
        });
        _formKey.currentState.save();
        dynamic result= await _auth.registerEmailAndPassword(_email, _password,_username);
        if(result==null){
            loading=false;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
    );
  }
  Widget _loginButton(){
    return  MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),
      color: Colors.green,
      splashColor: Colors.teal,
      textColor: Colors.white,
      child: new Text("Sign In"),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
    );
  }


  Widget _defaultPadding(){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
    );
  }


  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.blue,
        centerTitle: true,

      ),

      body: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/reset.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:  Center(
          child: SingleChildScrollView(
            child: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new SizedBox(
                    width: double.infinity,
                    child: Container(

                      child: new Text("Create",
                        textAlign: TextAlign.left,
                        style:TextStyle(fontSize: 50,
                          color: Colors.blueGrey,),
                      ),
                    ),
                  ),

                  new SizedBox(
                    width: double.infinity,
                    child: Container(

                      child: new Text("Account",
                        textAlign: TextAlign.left,
                        style:TextStyle(fontSize: 50,
                          color: Colors.blueGrey,),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                  ),

                  new Form(
                    key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _usernameField(),
                          _defaultPadding(),
                          _emailField(),
                          _defaultPadding(),
                          _passwordField(),
                          _defaultPadding(),
                          _confirmPasswrodField(),
                          _defaultPadding(),
                          _submitButton(),

                    ],

                  )),
                  SizedBox(
                    height: 10.0,
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
                          _loginButton(),

                        ],),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

      ),

    );
  }
}

