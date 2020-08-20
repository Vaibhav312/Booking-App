import 'package:first_app/screens/Order/products_details/electrician_details.dart';
import 'package:first_app/screens/Order/styles/global_styles.dart';
import 'package:flutter/material.dart';


class Service {
  final String serviceName;
  final IconData icon;
  final int type;
  Service({this.serviceName, this.icon,this.type});
  
}
class ServicesCards extends StatelessWidget {

  List<Service> allServices = [
    Service(serviceName: 'Groceries', icon: Icons.fastfood,type:1),
    Service(serviceName: 'Electrician', icon: Icons.lightbulb_outline,type:2),
    Service(serviceName: 'Home Tution', icon: Icons.book,type:3),
    Service(serviceName: 'Plumber', icon: Icons.bubble_chart,type:4),
    Service(serviceName: 'Painters', icon: Icons.format_paint,type:5),
    Service(serviceName: 'Doctors', icon: Icons.library_books,type:6),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: GridView.builder(
          itemCount: allServices.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                child: InkWell(
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child:Icon(allServices[index].icon,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              Text(allServices[index].serviceName,
              style: TextStyle(
                color: GlobalStyles.secondaryColor,
              ),
              ),
            ],
          )),
    );
  }
}
