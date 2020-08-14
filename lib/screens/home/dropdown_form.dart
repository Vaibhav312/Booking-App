import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  int _value = 1;
  int inputFieldValue;

  void selectedValue(value){
    setState(() {
      inputFieldValue=value;

    });
    //print(inputFieldValue);

  }

  Widget _dropDownField(){
    return DropdownButtonFormField(
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
            child: Text("4"),
            value: 4,
          ),
          DropdownMenuItem(
            child: Text("3"),
            value: 3,
          ),
          DropdownMenuItem(
            child: Text("2"),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text("1"),
            value: 1,
          ),
        ], onChanged: (value){
      selectedValue(value);
    });
  }
  Widget _listViewDisplay(){
    return Expanded(
        child: new ListView.builder
          (
            itemCount: inputFieldValue,
            itemBuilder: (BuildContext ctxt, int Index) {
              return TextField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintText: "Enter data",

                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              );
            }
        )
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown Form"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _dropDownField(),
           SizedBox(height: 20.0,),
           _listViewDisplay(),
          ],
        ),
      ),
    );

  }
}
