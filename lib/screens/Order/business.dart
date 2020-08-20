import 'package:first_app/screens/Order/custom_widgets/basicPadding.dart';
import 'package:first_app/screens/Order/styles/global_styles.dart';
import 'package:flutter/material.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Card(
        elevation: 10.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              BasicPadding(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.business,
                    size: 50.0,
                    color: GlobalStyles.secondaryColor,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text('Do you want to start your business online ?',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: GlobalStyles.secondaryColor
                      ),
                    ),
                  ),
                  Icon(Icons.call,
                    size: 25.0,
                    color: GlobalStyles.secondaryColor,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
