import 'package:first_app/screens/Order/custom_widgets/services_card.dart';
import 'package:first_app/screens/Order/products_details/electrician_details.dart';
import 'package:first_app/screens/Order/products_details/plumber_details.dart';
import 'package:first_app/screens/Order/products_details/oyo_taxi_details.dart';
import 'package:first_app/screens/Order/products_details/tution_details.dart';
import 'package:flutter/material.dart';
class AppServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ServicesCards(),
    );
  }
}
