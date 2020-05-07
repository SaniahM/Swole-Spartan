import 'package:flutter/material.dart';

import 'appbar.dart';
import 'footnavbar.dart';
import 'properties.dart';
import 'screens.dart';
import 'side_menus.dart';

class GenericTemplate extends StatefulWidget {
  @override
  _GenericTemplate createState() => _GenericTemplate();
}

class _GenericTemplate extends State<GenericTemplate> {
  int _currentIndex = 0;
  int _sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.grey[getColor()[0]],
      appBar: topBar(
        context,
        getColor()[0],
        getColor()[1],
        _sectionIndex,
      ),
      drawer: menus()[_sectionIndex],
      body: Card(
          color: Colors.white,
          elevation: 10,
          margin: EdgeInsets.only(top: 8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

///////////////////////////////////////////////////////////////////////////////////////////////
/////CHANGE ONLY THIS PART TO FIT ANY SCREEN INTO THE COMMON ITEMS TEMPLATE////////////////////

          child: screens()[_currentIndex]

/////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
          ),
      bottomNavigationBar: footBar(_sectionIndex, (index) {
        setState(() {
          _sectionIndex = index;
          _currentIndex = index;
        });
      }),
    );
  }
}

//Myapp
