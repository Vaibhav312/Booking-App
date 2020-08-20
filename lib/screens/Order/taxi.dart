import 'package:flutter/material.dart';
import 'package:first_app/screens/Order/styles/global_styles.dart';

class Taxi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Card(
        elevation: 10.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.local_taxi,
                size: 50.0,
                color: GlobalStyles.secondaryColor,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text('Book a City Taxi to your destination in town',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: GlobalStyles.secondaryColor
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                size: 20.0,
                color: GlobalStyles.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
