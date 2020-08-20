import 'package:first_app/screens/Order/products_details/electrician_details.dart';
import 'package:flutter/material.dart';

class TutionDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Tutions'),
        centerTitle: true,
      ),
      body: ExpansionTile(
        title: Text("Shows more"),

        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 32,
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70.0,
                      width: 70.0,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ElectricianDetails()),
                        ),
                        child: Card(
                          elevation: 10.0,
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Icon(Icons.fastfood),
                        ),
                      ),
                    ),
                    Text('Groceries'),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
