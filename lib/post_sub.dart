import 'package:flutter/material.dart';
import 'thread_arg.dart';
import 'post_list.dart';

class DFPostPageSub extends StatefulWidget{
  @override
  _DFPostPageSub createState() => _DFPostPageSub();
}

class _DFPostPageSub extends State<DFPostPageSub>{

  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  @override
  Widget build(BuildContext context){
    ThreadArg arg=ModalRoute.of(context).settings.arguments;
    return Column(
                children: <Widget> [

                  SizedBox(height: 20),

                  Center( 
                    child: Container(
                    child:Text(
                      arg.threadTitle,
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
                    child: postsList(arg.docID)

                     
                  
                  ),
                                    
                ]

              );

      
  }
}

