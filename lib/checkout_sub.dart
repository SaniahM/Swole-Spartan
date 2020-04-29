
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shopping_list.dart';
import 'user.dart';
// import 'auth.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


class CheckoutPageSub extends StatefulWidget {
  @override
  _CheckoutPageStateSub createState() => _CheckoutPageStateSub();
}


class _CheckoutPageStateSub extends State<CheckoutPageSub> {



@override
Widget build(BuildContext context) {

final user = Provider.of<User>(context);

return StreamBuilder<UserData>(
    stream: DatabaseService(uid: user.uid).userData,
    
     builder:(context,snapshot){ 
       
       UserData userdata = snapshot.data;

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

            child: Wrap(
              children: <Widget>[
                //CHECKOUT TITLE
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
                      'CHECKOUT',
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

                //DELIVERY DETAILS

                
                Container(
                  height: 300,
                  //color:Colors.pink,
                  margin: EdgeInsets.fromLTRB(60, 20, 60, 0),
                  child: Wrap(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person_outline, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                              Text('Name',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),
                             
                            Padding(padding: EdgeInsets.only(left: 20),),

                            //SWITCH
                           Text(userdata.firstName+ " " +userdata.lastName,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            )

                            ],
                          ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),


                      //PHONE ROW
                      Row(
                        children: <Widget>[
                          Icon(Icons.phone, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                              Text('Phone Number',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),
                             
                            Padding(padding: EdgeInsets.only(left: 20),),

                           Text(userdata.phone, //SWITCH
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            )

                            ],
                          ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      //EMAIL ROW
                      Row(
                        children: <Widget>[
                          Icon(Icons.email, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                              Text('Email',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),
                             
                            Padding(padding: EdgeInsets.only(left: 20),),

                           Text(userdata.email, //SWITCH
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            )

                            ],
                          ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),


                      //ADDRESS
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                              Text('Address',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),
                             
                            Padding(padding: EdgeInsets.only(left: 20),),

                           Text(userdata.address, //SWITCH
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            )

                            ],
                          ),                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                //YOUR ORDER TITLE
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    //width: 10,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Text(
                      'YOUR ORDER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),

                //ORDER DETAILS
                Container(
                  //height: 90,
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
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

                //PLACE ORDER BUTTON
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 15, 40, 0),
                    padding: EdgeInsets.fromLTRB(0, 0.0, 0.0, 2.5),
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
                          'PLACE ORDER',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: ssFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),






              ],
            ),


          ),
        );

      
    }
  );
  }
}