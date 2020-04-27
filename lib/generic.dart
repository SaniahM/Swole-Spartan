import 'package:flutter/material.dart';
import 'appbar.dart';
// import 'spartan_icons_icons.dart';
import 'properties.dart';
import 'screens.dart';
import 'drawer.dart';
import 'footnavbar.dart';

class GenericTemplate extends StatefulWidget{
  @override
  _GenericTemplate createState() => _GenericTemplate();
}

class _GenericTemplate extends State<GenericTemplate>{
  int _currentIndex = 0;
  int _sectionIndex = 0;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      
      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1]),
      drawer: drawerFunc(),
      body: Card(
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.only(top:8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

//////////////////////////////////////////////////////////////////////////////////////////
/////CHANGE ONLY THIS PART TO FIT ANY SCREEN INTO THE COMMON ITEMS TEMPLATE/////////////
            
              child: screens()[_currentIndex]

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////      
      ),

      bottomNavigationBar: footBar(_sectionIndex, (index){
            setState(() {
              _sectionIndex = index;
              _currentIndex = index;
            });
          }), 

      );
  }
}

//Myapp


