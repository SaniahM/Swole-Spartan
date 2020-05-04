import 'properties.dart';
import 'dropdown_menu.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'storescreenarg.dart';



class ViewProductPageSub extends StatefulWidget{
  @override
  _ViewProductSub createState() => _ViewProductSub();
}

class _ViewProductSub extends State<ViewProductPageSub>{

  int counter = 0;
  int defaultValue = 0;

@override
  Widget build(BuildContext context){
    int deepOrangeShade = getColor()[1];
    ScreenArg arg = ModalRoute.of(context).settings.arguments;
    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    return SingleChildScrollView(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              children: <Widget>[

                //Product Name
                Container(
                  margin: EdgeInsets.fromLTRB(40,30,40,0),
                  child:Text(
                    arg.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ssFont,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),


                //Product Picture
                Container(
                    width: 200,
                    height: 170,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(arg.imgLink),
                        fit: BoxFit.fill,
                      ),
                    )
                ),

                //Product Price
                Text('Rs. ' + arg.price.toString(),
                  style: TextStyle(
                    fontFamily: ssFont,
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Container(child: getVariations(arg.id)),



                //FLAVOUR Selection row
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(40,22,0,0),
                          child:Text(
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

                        //     //Dropdown Menu for Flavour



                        Expanded(
                          child: Container(
                            height: 23,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            margin: EdgeInsets.fromLTRB(30,32,20,10),
                            child: Center(child: DropDown()),
                          ),
                        ),
                      ]
                  ),
                ),

                //WEIGHT Selection row
                Padding(
                  padding: const EdgeInsets.only(bottom:10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40,0,0,0),
                        child:Text(
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

                      //Dropdown menu for WEIGHT
                      Expanded(
                        child: Container(
                          height: 23,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: EdgeInsets.fromLTRB(40,0,20,0),
                          child: Center(child: DropDown()),
                        ),
                      ),

                    ],
                  ),
                ),

                //QUANTITY Selection row
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40,10,0,0),
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

                    Container(
                      margin: EdgeInsets.only(left: 30),
                      width: 80,
                      height: 20,
                      // color: Colors.orange,

                      //Quantity Counter
                      child: Container (
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontFamily: ssFont,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),

                    // // //     //Add to Cart Button

                    IconButton(
                      onPressed: (){},
                      padding: EdgeInsets.only(left:30),
                      icon: Icon(Icons.add_shopping_cart),
                      color: Colors.orange[deepOrangeShade],
                    ),
                  ],
                ),








                //DESCRIPTION
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 10, 0),
                  child: ExpansionTile(
                    trailing: Icon(Icons.keyboard_arrow_down, color: Colors.orange[deepOrangeShade]),
                    title: Text('Description',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                      ),),

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                        child: Text(arg.desc,
                          overflow: TextOverflow.ellipsis ,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: ssFont,
                          ),
                        ),
                      ),
                    ],

                  ),
                ),


                //REVIEW
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 10, 0),
                  child: ExpansionTile(

                    trailing: Icon(Icons.keyboard_arrow_down, color: Colors.orange[deepOrangeShade]),
                    title: Text('Reviews',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                      ),),

                    children: <Widget>[
                      Wrap(
                        children: <Widget>[

                        ],
                      ),
                    ],

                  ),
                ),


              ],
            ),
          ),
        );



  }
}