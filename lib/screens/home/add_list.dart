import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final FirebaseAuth _auth=FirebaseAuth.instance;


  List<String> listItems = [];
  TextEditingController textEditingController=new TextEditingController();
  GlobalKey<FormState> _globalKey=new GlobalKey<FormState>();

  void addItems(text){

    setState(() {
      listItems.add(text);
    });
  }

  Widget _listTextField(){
    return TextFormField(
      validator: (String value){
        if(value.isEmpty){
          return 'Enter some data to add in list';
        }
        return null;
      },
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,

        hintText: "Enter any value",
        fillColor: Colors.white,
      ),

      controller: textEditingController,

    );
  }
  Widget _displayLists(){

    return Expanded(
        child: new ListView.builder
          (
            itemCount: listItems.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Dismissible(
                        key: Key(listItems[index]),
                        onDismissed: (DismissDirection direction){
                          listItems.removeAt(index);
                        },

                        child: Center(
                          child: new Text(
                            listItems[index],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,

                            ),
                          ),
                        ),
                    ),

                  ],
                ),
              );
            }
        )
    );
  }
  Widget _addListButton(){
    return RaisedButton(
      child: Text("Add"),
    onPressed: () async{

      setState(() {
        if(!_globalKey.currentState.validate()){
          return;
        }

        listItems.add(textEditingController.text);
        textEditingController.clear();
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add_List_Dynamically"
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[

              Form(key:_globalKey,
                  child: _listTextField()),

              SizedBox(
                height: 20.0,
              ),
              _addListButton(),

              _displayLists(),

            ],
          ),
        )
    );
  }
}
