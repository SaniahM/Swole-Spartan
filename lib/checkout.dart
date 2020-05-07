import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'footnavbar.dart';
import 'properties.dart';
import 'screens.dart';

//Checkout page.
class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _currentIndex = 4;
  int _sectionIndex = 0;
  @override
  Widget build(BuildContext context) {
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
