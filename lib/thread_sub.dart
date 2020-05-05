import 'package:flutter/material.dart';
import 'thread_list.dart';


class DFThreadPageSub extends StatefulWidget{
  @override
  _DFThreadPageSub createState() => _DFThreadPageSub();
}

class _DFThreadPageSub extends State<DFThreadPageSub>{


  @override
  Widget build(BuildContext context){

    String ssFont = 'NeusaNextStf-CompactRegular.otf';
    String category = ModalRoute.of(context).settings.arguments;

    return Column(
                children: <Widget> 
                [
                  SizedBox(height: 20),
                  
                  Center( 
                    child: Container(
                    child:Text(
                      category,
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
                    child: threadsList(category)
                  
                  ),

                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/new_thread', arguments: category);
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.orange[600], 
                  ),



                ]
              );

  }

}