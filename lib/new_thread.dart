import 'package:flutter/material.dart';
import 'appbar.dart';
import 'properties.dart';

import 'footnavbar.dart';
import 'screens.dart';
import 'side_menus.dart';

class DFNewThreadPage extends StatefulWidget{
  @override
  _DFNewThreadPage createState() => _DFNewThreadPage();
}

class _DFNewThreadPage extends State<DFNewThreadPage>{
  int _currentIndex = 10;
  int _sectionIndex = 2;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      
      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1], _sectionIndex),
      drawer: menus()[_sectionIndex],
      body: Card(
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.only(top:8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            
              child: screens()[_currentIndex],

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


