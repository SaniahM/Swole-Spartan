import 'package:flutter/material.dart';
import 'appbar.dart';
import 'footnavbar.dart';
import 'properties.dart';

class SearchBarPage extends StatefulWidget{
  @override
  _SearchBarPage createState() => _SearchBarPage();
}

class _SearchBarPage extends State<SearchBarPage>{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      
      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1]),

      body: Card(
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.only(top:8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

//////////////////////////////////////////////////////////////////////////////////////////
/////CHANGE ONLY THIS PART TO FIT ANY SCREEN INTO THE COMMON ITEMS TEMPLATE/////////////
            
              child: Column(
                children:  
                  [
                    Padding(padding: EdgeInsets.all(196.5)),
                    Padding(padding: EdgeInsets.all(100)),
                  ]  
               
                )

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////      
      ),

      bottomNavigationBar: FootNavBar(), 

      );
  }
}

//Myapp


