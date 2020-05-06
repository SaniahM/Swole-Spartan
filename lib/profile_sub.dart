import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shopping_list.dart';
import 'user.dart';

import 'package:provider/provider.dart';
import 'auth.dart';


class ProfilePageSub extends StatefulWidget {
  @override
  _ProfilePageStateSub createState() => _ProfilePageStateSub();
}


class _ProfilePageStateSub extends State<ProfilePageSub> {



@override
Widget build(BuildContext context) {
final AuthService _auth = AuthService();
final user = Provider.of<User>(context);
if(user != null){
return StreamBuilder<UserData>(
    
      stream: DatabaseService(uid: user.uid).userData,
    
     builder:(context,snapshot){ 
       
       UserData userdata = snapshot.data;

        return Container(
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
                      'Account Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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

                            SizedBox(width: 10,),
                             
                            Padding(padding: EdgeInsets.only(left: 20),),

                            //SWITCH
                           Text(userdata.firstName+ " " +userdata.lastName,
                              style: TextStyle(
                                fontSize: 14,
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

                              Text('Phone',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(width: 8,),
                             
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

                            SizedBox(width: 10,),

                             
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


                //PLACE ORDER BUTTON
                InkWell(
                  onTap: () async {
                     await _auth.signOut();
                     Navigator.of(context).pushNamed('/login');
                  },            
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 15, 40, 0),
                    padding: EdgeInsets.fromLTRB(0, 0.0, 0.0, 2.5),
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey,
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
                          'Log Out',
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


          );
        

      
    }
  );}
  else{
    return Center();
  }
  }
}