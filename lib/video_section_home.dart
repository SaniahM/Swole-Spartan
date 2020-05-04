import 'package:flutter/material.dart';
import 'video_list.dart';


class VSHomePage extends StatefulWidget{
  @override
  _VSHomePage createState() => _VSHomePage();
}

class _VSHomePage extends State<VSHomePage>{

  @override
  Widget build(BuildContext context){
    String ssFont = 'NeusaNextStf-CompactRegular.otf';
    return Column(
      
      children:[
      SizedBox(height: 20),
      Text(
            'FEATURED PRODUCTS',
            style: TextStyle(
            fontSize: 20.0,
            fontFamily: ssFont,
            color: Colors.grey,
            fontWeight: FontWeight.bold
            ),
          ),
        Padding(padding: EdgeInsets.only(top: 30),),
        Expanded(child:videolist()),
      ]
    
    );
    
  }

}