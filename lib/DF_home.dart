import 'package:flutter/material.dart';
import 'DF_home_list.dart';

class DFHomePage extends StatefulWidget{
  @override
  _DFHomePage createState() => _DFHomePage();
}


class _DFHomePage extends State<DFHomePage>{

  @override
  Widget build(BuildContext context){

    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    return Column(
                children:
                [
                  SizedBox(height: 20),

                  Center( 
                  child: Container(
                  child:Text(
                    'DISCUSSION FORUM',
                    style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: ssFont,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                    ),
                    ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Expanded(
                    child: forumList()
                  ),

                ]  
               
    );
  } 
}

