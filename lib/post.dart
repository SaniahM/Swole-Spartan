import 'package:flutter/material.dart';

import 'appbar.dart';
import 'footnavbar.dart';
import 'properties.dart';
import 'screens.dart';
import 'side_menus.dart';

class DFPostPage extends StatefulWidget {
  @override
  _DFPostPage createState() => _DFPostPage();
}

class _DFPostPage extends State<DFPostPage> {
  int _currentIndex = 10;
  int _sectionIndex = 2;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.grey[getColor()[0]],
      appBar: topbar(context, getColor()[0], getColor()[1], _sectionIndex),
      drawer: menus()[_sectionIndex],
      body: Card(
          color: Colors.white,
          elevation: 10,
          margin: EdgeInsets.only(top: 8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: screens()[_currentIndex]),
      bottomNavigationBar: footBar(_sectionIndex, (index) {
        setState(() {
          _sectionIndex = index;
          _currentIndex = index;
        });
      }),
    );
  }
}
