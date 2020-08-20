import 'package:first_app/screens/Order/products_details/electrician_details.dart';
import 'package:flutter/material.dart';


class ServicesList {
  ServicesList({this.serviceName, this.icon});
  final String serviceName;
  final String icon;
}
class ServicesCards extends StatelessWidget {

  List<ServicesList> allServices = [
    ServicesList(serviceName: 'Electrician', icon: 'ElectricianDetails'),
    ServicesList(serviceName: 'Home Tution', icon: 'Icons.book'),
    ServicesList(serviceName: 'Plumber', icon: 'Icons.bubble_chart'),
    ServicesList(serviceName: 'OYO Taxi', icon: 'Icons.local_taxi'),
    ServicesList(serviceName: 'News', icon: 'Icons.library_books'),
    ServicesList(serviceName: 'Groceries', icon: 'Icons.fastfood'),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
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
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child:Icon(Icons.account_circle),
                  ),
                ),
              ),
              Text(allServices[index].serviceName),
            ],
          )),
    );
  }
}
