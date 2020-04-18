//This screen is the screen that is loaded whenever a product is clicked on
//and it displays all relevant product details along with selection options
//for specific details e.g flavour, weight
//The dropdown menus only shows flavour options for both right now

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//our own imports
import 'package:flutter_counter/flutter_counter.dart';
import 'properties.dart';
import 'dropdown_menu.dart';
import 'appbar.dart';
import 'footnavbar.dart';

class ViewProductPage extends StatefulWidget{
  @override
  _ViewProduct createState() => _ViewProduct();
}

class _ViewProduct extends State<ViewProductPage>{
  
  //Counter variables
  int counter = 0;
  int defaultValue = 0;
  @override
  Widget build(BuildContext context){
    //Set Colors from here
    int deepOrangeShade = getColor()[1];

    String ssFont = 'NeusaNextStf-CompactRegular.otf';

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
            
          child: Center(
          child: Column(
            children: <Widget>[

              //Product Name
              Container(
                width: 220,
                margin: EdgeInsets.only(top:10, bottom: 10),
                child:Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  child: Text(
                    'Cellucor COR-Performance Isolate Protein Powder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ssFont,
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              //Product Picture
              Container(
                width: 200,
                height: 170,
                margin: EdgeInsets.only(bottom: 15),
                child: Image.asset('images/products/Cellucor.jpg',
                  fit: BoxFit.contain,
                ),
              ),

              //Product Price
              Text('Rs 10,500',
                style: TextStyle(
                  fontFamily: ssFont,
                  fontSize: 20,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //FLAVOUR Selection row
              Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 30,
                    margin: EdgeInsets.only(top:20,left:20,bottom:5),
                    child:Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                      child: Text(
                        'FLAVOUR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: ssFont,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  //Dropdown Menu for Flavour
                  Expanded(
                    child: Container(
                      height: 23,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.only(left:30,top:19,right:20, bottom:5),
                      child: Center(child: DropDown()),
                      ),
                  ),
                ]
              ),

              //WEIGHT Selection row
              Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 30,
                    margin: EdgeInsets.only(left:20,bottom:5),
                    child:Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                      child: Text(
                        'WEIGHT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: ssFont,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  //Dropdown menu for WEIGHT
                  Expanded(
                    child: Container(
                      height: 23,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.only(left:30,right:20,bottom:5),
                      child: Center(child: DropDown()),
                    ),
                  ),

                ],
              ),

                //QUANTITY Selection row
                Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 30,
                    margin: EdgeInsets.only(left:20),
                    child:Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                      child: Text(
                        'QUANTITY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: ssFont,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 110,
                    height: 50,
                    color: Colors.white,

                    //Quantity Counter
                    child: Counter(
                      textStyle: TextStyle(
                        fontSize: 16.5,
                      ),
                      buttonSize: 22,
                      color: Colors.grey[300],
                      initialValue: defaultValue,
                      minValue: 0,
                      maxValue: 50,
                      step: 1,
                      decimalPlaces: 0,
                      onChanged: (value){
                        setState(() {
                          defaultValue = value;
                          counter = value;
                        });
                      },
                    ),
                  ),

                  //Add to Cart Button

                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add_shopping_cart),
                    color: Colors.orange[deepOrangeShade],
                  ),
                ],
                ),

              //DESCRIPTION
              Container(
                margin: EdgeInsets.only(left:20,top:30,bottom:10),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_down, color: Colors.orange[deepOrangeShade]),
                      Text('Description',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
              ),

              //REVIEW
              Container(
                margin: EdgeInsets.only(left:20),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_down, color: Colors.orange[deepOrangeShade]),
                      Text('Reviews',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: ssFont,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                ),
              ),


            ],
          ),

          )

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////      
      ),

      bottomNavigationBar: FootNavBar(), 

      );
  }



  }