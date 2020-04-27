import 'package:flutter/material.dart';
import 'carousel.dart';
import 'featured.dart';

class StoreHomePage extends StatefulWidget{
  @override
  _StoreHome createState() => _StoreHome();
}

class _StoreHome extends State<StoreHomePage>{

  @override
  Widget build(BuildContext context){

    return Column(
                children:  
                  [
                    Padding(padding: EdgeInsets.all(22)),
                    carousel(),
                    Padding(padding: EdgeInsets.all(10)),
                    Expanded(child:featuredlist())
                  ]  
               
                );
  }
}