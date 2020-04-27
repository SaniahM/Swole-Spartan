import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shopping_list.dart';

class CartPageSub extends StatefulWidget {
  @override
  _CartPageSub createState() => _CartPageSub();
}

class _CartPageSub extends State<CartPageSub> {

@override
Widget build(BuildContext context) {


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
            /*decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),*/
            child: Wrap(
              children: <Widget>[
                //SHOPPING CART TITLE
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 3.0, 0.0, 0.0),
                    //width: 10,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Text(
                      'SHOPPING CART',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),

                //SCROLLABLE PRODUCT LIST
                Container(
                  margin: EdgeInsets.fromLTRB(40, 35, 40, 0),
                  height: 290,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: shoppingList(),
                      ),
                    ],
                  ),
                ),

                //Total Bill Window
                Container(
                  //height: 90,
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Subtotal row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Subtotal: ',
                            style: TextStyle(
                              fontFamily: ssFont,
                              fontSize: 11,
                              color: Colors.grey[800],
                            ),
                          ),
                          //Container for calculated prices

                          Container(
                            child: Text(
                              'Rs. 46000',
                              style: TextStyle(
                                fontFamily: ssFont,
                                fontSize: 11,
                                color: Colors.orange,
                              ),
                            ),

                          ),
                        ],
                      ),

                      //Divider
                      Divider(),

                      //Shipping row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Shipping: ',
                            style: TextStyle(
                              fontFamily: ssFont,
                              fontSize: 11,
                              color: Colors.grey[800],
                            ),
                          ),

                          Container(
                            child: Text(
                              'Rs. 500',
                              style: TextStyle(
                                fontFamily: ssFont,
                                fontSize: 11,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(),

                      //Total row

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total: ',
                            style: TextStyle(
                              fontFamily: ssFont,
                              fontSize: 11,
                              color: Colors.grey[800],
                            ),
                          ),

                          Container(
                            child: Text(
                              'Rs. 46500',
                              style: TextStyle(
                                fontFamily: ssFont,
                                fontSize: 11,
                                color: Colors.orange,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),

                //CHECKOUT BUTTON
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/checkout');
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 15, 40, 0),
                    padding: EdgeInsets.fromLTRB(60, 0.0, 0.0, 2.5),
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.orange,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset.zero,
                          color: Colors.grey[400],
                          blurRadius: 11,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'PROCEED TO CHECKOUT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: ssFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 25),
                      ],
                    ),
                  ),
                ),

                //Continue Shopping Button
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                    padding: EdgeInsets.fromLTRB(65, 0.0, 0.0, 2.5),
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset.zero,
                          color: Colors.grey[300],
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'CONTINUE SHOPPING',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: ssFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.orange,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right,
                            color: Colors.orange, size: 25),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

  }
}