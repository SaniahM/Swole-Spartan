import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';
import 'storehome.dart';
import 'product_details_main.dart';
import 'sample.dart';
import 'profile.dart';
import 'search_bar.dart';
import 'side_menu.dart';
import 'cart.dart';
import 'video_section_home.dart';
import 'DF_home.dart';

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
        '/sample': (BuildContext context) => new SamplePage(),
        '/profile': (BuildContext context) => new ProfilePage(),
        '/cart': (BuildContext context) => new CartPage(),
        '/sidemenu': (BuildContext context) => new SideMenuPage(),
        '/searchbar': (BuildContext context) => new SearchBarPage(),
        '/dicussiomforum': (BuildContext context) => new DFHomePage(), 
        '/videosection': (BuildContext context) => new VSHomePage(),
      },
      home: new LoginPage(),
    );

  }//build
}