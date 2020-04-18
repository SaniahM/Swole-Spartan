//This screen is the screen that is loaded whenever a product is clicked on
//and it displays all relevant product details along with selection options
//for specific details e.g flavour, weight
//The dropdown menus only shows flavour options for both right now

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//our own imports
import 'package:flutter_counter/flutter_counter.dart';
import 'spartan_icons_icons.dart';
import 'dropdown_menu.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home()
    );
  }//build
}

class Home extends StatefulWidget{
  @override
  _CommonItemsEmpty createState() => _CommonItemsEmpty();
}
//The AppBar, bottom navigation bar
class _CommonItemsEmpty extends State<Home>{
  //Foot Navigation Bar update
  int _currentIndex = 0;

  //Counter variables
  int counter = 0;
  int defaultValue = 0;
  @override
  Widget build(BuildContext context){
    //Set Colors from here
    int deepOrangeShade = 300;
    int greyShade = 300;
    String ss_Font = 'NeusaNextStf-CompactRegular.otf';

    return Scaffold(
      backgroundColor: Colors.grey[greyShade],
      appBar: AppBar(
          backgroundColor: Colors.grey[greyShade],
          elevation: 0,
          iconTheme: IconThemeData(color:Colors.deepOrange[deepOrangeShade],size: 19),
          actions: <Widget>[
            Padding( //Search Button
                padding: EdgeInsets.only(right: 235.0),
                child: Icon(Icons.menu)
              //IconButton(icon: Icon(Icons.menu)).
              // Icons in appbar to be replaced by iconbuttons as soon
              // as we have actions available
            ),

            Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(SpartanIcons.profile)

            ),
            Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(SpartanIcons.sCart)

            ),
            Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: Icon(SpartanIcons.search)

            ),


          ]
      ),

    //The card that displays the product details, raised over the scaffold
      body: Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.only(top:8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

        //Product details
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
                      fontFamily: ss_Font,
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
                child: Image.asset('images/Cellucor COR-Performance Isolate PP.jpeg',
                  fit: BoxFit.contain,
                ),
              ),

              //Product Price
              Text('Rs 10,500',
                style: TextStyle(
                  fontFamily: ss_Font,
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
                          fontFamily: ss_Font,
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
                          fontFamily: ss_Font,
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
                          fontFamily: ss_Font,
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
                        fontFamily: ss_Font,
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
                          fontFamily: ss_Font,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                ),
              ),


            ],
          ),

          ),
          ),




          bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          items:
          [
            BottomNavigationBarItem( //Store
                icon: Icon(SpartanIcons.store),
                title: Text('')

            ),

            BottomNavigationBarItem( //Video Section
                icon: Icon(SpartanIcons.vSection),
                title: Text('')

            ),

            BottomNavigationBarItem( //Discussion Forum
                icon: Icon(SpartanIcons.dForum),
                title: Text('')

            )
          ],
          iconSize: 20,
          backgroundColor: Colors.grey[greyShade],
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedIconTheme:IconThemeData(color:Colors.deepOrange[deepOrangeShade]),
          unselectedIconTheme:IconThemeData(color:Colors.blue[900])),

    );
  }
}
