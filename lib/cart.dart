import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'footnavbar.dart';
import 'properties.dart';
import 'screens.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  int _currentIndex = 3;
  int _sectionIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.grey[getColor()[0]],
      appBar: topbar(context, getColor()[0], getColor()[1], _sectionIndex),
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
          _sectionIndex = index;
          _currentIndex = index;
        });
      }),
    );
  }
}

//Myapp
