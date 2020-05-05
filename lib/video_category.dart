import 'package:flutter/material.dart';
import 'appbar.dart';
import 'footnavbar.dart';
import 'properties.dart';
import 'screens.dart';
import 'side_menus.dart';

class VSCatPage extends StatefulWidget{
  @override
  _VSCategory createState() => _VSCategory();
}

class _VSCategory extends State<VSCatPage>{
  int _currentIndex = 8;
  int _sectionIndex = 1;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      
      
      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1],_sectionIndex),
      
      drawer: menus()[_sectionIndex],

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
              _currentIndex = index;
              _sectionIndex = index;
            });
          }), 

      );
  }
}
