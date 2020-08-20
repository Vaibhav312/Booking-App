
import 'package:first_app/screens/Order/custom_widgets/basicPadding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/Order/styles/global_styles.dart';

class News extends StatelessWidget {

  Widget newsText() {
    return Text("News",
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: GlobalStyles.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: GlobalStyles.primaryColor,
        decorationStyle: TextDecorationStyle.solid,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Card(
        elevation: 10.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              newsText(),
              BasicPadding(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.library_books,
                    size: 50.0,
                    color: GlobalStyles.secondaryColor,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text('29.1% people in Delhi have antibodies against COVID-19: Delhi Health Minister',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      softWrap: true,
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
            ],
          ),
        ),
      ),
    );
  }
}
