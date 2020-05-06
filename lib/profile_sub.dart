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



bool _isEditingText = false;
TextEditingController _editingController;
String initialText = "Initial Text";

@override
void initState() {
  super.initState();
  _editingController = TextEditingController(text: initialText);
}

@override
void dispose() {
  _editingController.dispose();
  super.dispose();
}

// @override
// Widget _editTitleTextField() {
// if (_isEditingText)
//     return Center(
//       child: TextField(
//         onSubmitted: (newValue){
//           setState(() {
//             initialText = newValue;
//             _isEditingText =false;
//           });
//         },
//         autofocus: true,
//         controller: _editingController,
//       ),
//     );
//   return InkWell(
//     onTap: () {
//       setState(() {
//         _isEditingText = true;
//       });
//     },
//     child: Text(
//   initialText,
//   style: TextStyle(
//     color: Colors.black,
//     fontSize: 18.0,
//   ),
//     )
//  );

// }


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
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 80.0),

                // DELIVERY DETAILS.

                
                Container(
                  height: 300,
                  // color:Colors.pink,
                  margin: EdgeInsets.fromLTRB(40, 20, 60, 0),
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
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(width: 50.0,),
                             
                            // Padding(padding: EdgeInsets.only(left: 20),),

                            //SWITCH
                          //  if (_isEditingText)

                           Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: userdata.firstName+ " " + userdata.lastName,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ), 
                             
                            //  Text(userdata.firstName+ " " +userdata.lastName,
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       fontFamily: ssFont,
                            //       color: Colors.grey,
                            //     ),
                            //   ),
                          //  )

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
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(width: 48.0),
                            
                             
                            // Padding(padding: EdgeInsets.only(left: 20),),

                            Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: userdata.phone,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ),
                           
                          //  Text(userdata.phone, //SWITCH
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontFamily: ssFont,
                          //       color: Colors.grey,
                          //     ),
                          //   )

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
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(width: 55.0),

                             
                            // Padding(padding: EdgeInsets.only(left: 20),),

                           Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: userdata.email,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ),

                          //  Text(userdata.email, //SWITCH
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontFamily: ssFont,
                          //       color: Colors.grey,
                          //     ),
                          //   )

                            ],
                          ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30.0,
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
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),
                             
                            SizedBox(width: 35.0),

                            // Padding(padding: EdgeInsets.only(left: 20),),

                           Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: userdata.address,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ),

                          //  Text(userdata.address, //SWITCH
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontFamily: ssFont,
                          //       color: Colors.grey,
                          //     ),
                          //   )

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
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red[400],
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