import 'package:SwoleSpartan/checkout.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

import 'product_details_main.dart';
import 'generic.dart';
import 'storecategoryscreen.dart';
import 'cart.dart';

import 'package:provider/provider.dart';
import 'auth.dart';
import 'user.dart';
import 'gateway.dart';

import 'thread.dart';
import 'post.dart';

import 'new_thread.dart';
import 'video_category.dart';

import 'profile.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    
    return StreamProvider<User>.value(

        value: AuthService().user,

        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder> {
          '/login': (BuildContext context) => new LoginPage(),
          '/viewproduct': (BuildContext context) => new ViewProductPage(),
          '/signup': (BuildContext context) => new SignupPage(),
          '/generic': (BuildContext context) => new GenericTemplate(),
          '/cart': (BuildContext context) => new CartPage(),
          '/checkout': (BuildContext context) => new CheckoutPage(),
          '/categoryscreen': (BuildContext context) => new StoreCatPage(),
          '/thread': (BuildContext context) => new DFThreadPage(),
          '/post': (BuildContext context) => new DFPostPage(),
          '/new_thread': (BuildContext context) => new DFNewThreadPage(),
          '/vscategories': (BuildContext context) => new VSCatPage(),
          '/profile': (BuildContext context) => new ProfilePage(),


        },
      
        home: new Gateway(),
        theme: new ThemeData(
          // canvasColor: Colors.orange[400],
          fontFamily: 'NeusaNextStf-CompactRegular.otf',
        )      
      
      ),
    );

  }//build
}