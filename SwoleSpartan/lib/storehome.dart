import 'package:flutter/material.dart';
import 'appbar.dart';
import 'footnavbar.dart';
import 'carousel.dart';
import 'featured.dart';
import 'properties.dart';

class StoreHomePage extends StatefulWidget{
  @override
  _StoreHome createState() => _StoreHome();
}

class _StoreHome extends State<StoreHomePage>{

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
                    Padding(padding: EdgeInsets.all(22)),
                    carousel(),
                    Padding(padding: EdgeInsets.all(10)),
                    Expanded(child:featuredlist())
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


