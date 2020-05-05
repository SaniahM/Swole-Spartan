import 'package:flutter/material.dart';
import 'video_category_list.dart';

class VSCatPageSub extends StatefulWidget{
  @override
  _VSCatPageSub createState() => _VSCatPageSub();
}

class _VSCatPageSub extends State<VSCatPageSub>{

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