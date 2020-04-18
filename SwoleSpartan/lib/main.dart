import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';
import 'storehome.dart';
import 'product_details_main.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new LoginPage(),
        '/viewproduct': (BuildContext context) => new ViewProductPage(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/store': (BuildContext context) => new StoreHomePage(),

        
      },
      home: new LoginPage(),
    );

  }//build
}