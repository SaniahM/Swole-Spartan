import 'package:flutter/material.dart';
import 'video_category_list.dart';

class VSCatPage extends StatefulWidget{
  @override
  _VSCatPage createState() => _VSCatPage();
}

class _VSCatPage extends State<VSCatPage>{

  @override
  Widget build(BuildContext context){
    String ssFont = 'NeusaNextStf-CompactRegular.otf';
    String category = ModalRoute.of(context).settings.arguments;
    return Column(
      
      children:[
      SizedBox(height: 20),
        Container(  
          alignment: Alignment.center,
          width: 400.0,
          child: Text(
            category,
            style: TextStyle(
            fontSize: 20.0,
            fontFamily: ssFont,
            color: Colors.grey,
            fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 30),),
        Expanded(child:videoCategoryList(category)),
      ]
          
    );
    
  }

}