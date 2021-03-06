import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'footnavbar.dart';
import 'properties.dart';
import 'screens.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 12;
  int _sectionIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.grey[getColor()[0]],
      appBar: topBar(context, getColor()[0], getColor()[1], _sectionIndex),
      body: Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.only(top: 8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        child: screens()[_currentIndex],
      ),
      bottomNavigationBar: footBar(_sectionIndex, (index) {
        setState(() {
          _currentIndex = index;
          _sectionIndex = index;
        });
      }),
    );
  }
}
