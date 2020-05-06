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

    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    return Column(
                children:  
                  [
                    SizedBox(height: 20),
                    Container(
                    child:Text(
                      'FEATURED PRODUCTS',
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: ssFont,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    ),
                    SizedBox(height: 20),
                    carousel(),
                    Padding(padding: EdgeInsets.all(10)),
                    Expanded(child:featuredlist())
                  ]  
               
                );
  }
}