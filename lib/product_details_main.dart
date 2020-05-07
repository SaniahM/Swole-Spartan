//This screen is the screen that is loaded whenever a product is clicked on
//and it displays all relevant product details along with selection options
//for specific details e.g flavour, weight
//The dropdown menus only shows flavour options for both right now

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'properties.dart';
import 'screens.dart';
import 'appbar.dart';
import 'footnavbar.dart';
// import 'product_details_sub.dart';
// import 'package:provider/provider.dart';
// import 'user.dart';
class ViewProductPage extends StatefulWidget{
  @override
  _ViewProduct createState() => _ViewProduct();
}



class _ViewProduct extends State<ViewProductPage>{
  int _currentIndex = 5;
  int _sectionIndex = 0;
  //Counter variables

  @override
  Widget build(BuildContext context){
    //Set Colors from here
    // final user = Provider.of<User>(context);
    return Scaffold(

      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1],_sectionIndex),

      body: Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.only(top:8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

//////////////////////////////////////////////////////////////////////////////////////////
/////CHANGE ONLY THIS PART TO FIT ANY SCREEN INTO THE COMMON ITEMS TEMPLATE/////////////
        // child: SingleChildScrollView(
        child: screens()[_currentIndex],

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
        // ),
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