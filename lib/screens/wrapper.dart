import 'package:first_app/models/user.dart';
import 'package:first_app/screens/authenticate/authenticate.dart';
import 'package:first_app/screens/home/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    if(user ==null){

      return Authenticate();
    }else{
      String data=user.email;
      print(data);
      return Products(value: data);
    }
  }
}
