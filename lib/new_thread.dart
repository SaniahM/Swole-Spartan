import 'package:flutter/material.dart';
import 'appbar.dart';
// import 'spartan_icons_icons.dart';
import 'properties.dart';
import 'screens.dart';
import 'drawer.dart';
import 'footnavbar.dart';

class DFNewThreadPage extends StatefulWidget{
  @override
  _DFNewThreadPage createState() => _DFNewThreadPage();
}

class _DFNewThreadPage extends State<DFNewThreadPage>{
  int _currentIndex = 0;
  int _sectionIndex = 0;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      
      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1]),
      drawer: drawerFunc(),
      body: Card(
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.only(top:8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),


            
              child: SingleChildScrollView(
              child: Column(
                
                children: <Widget>[

                  SizedBox(height: 20),

                  Center(
                    child: Text(
                      "NEW THREAD",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: ssFont,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),


                  Card(
                    elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                          height: 400.0,
                          width: 330.0,
                          child: Column(children: <Widget> [

                          SizedBox(height: 30.0),


                          Container(
                            child: Text(
                              "THREAD TITLE",
                              style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: ssFont,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                              )
                            )
                          ), 
                          
                          Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: "Please enter your text here...",
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      ),
                                      helperMaxLines: 100,
                                      focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange)
                                    ),
                                  )
                                  )

                                ),

                            SizedBox(height: 30.0),

                            Container(
                            child: Text(
                              "INITIAL POST",
                              style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: ssFont,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                              )
                            )
                          ), 
                          
                          Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    autofocus: false,
                                    maxLines: null,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "Please enter your text here...",
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange)
                                    ),
                                  )
                                  )

                                ),

                          ]),

                          ),

                  ),

                  SizedBox(height: 10.0),

                  Container(
                    height: 40.0,
                    width: 275.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.orangeAccent,
                      color: Colors.orange,
                      elevation: 7.0,
                      child: InkWell( 
                        hoverColor: Colors.red,
                        splashColor: Colors.blueAccent,
                        onTap: () {
                          
                        },
                            child: Center(
                              child: Text(
                                "CREATE THREAD",
                                style: TextStyle(
                                  fontFamily: ssFont,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            )
                      ),
                    ),
                  ),

                  SizedBox(height: 200.0),

                ],
              ),
              )


      ),

      bottomNavigationBar: footBar(_sectionIndex, (index){
            setState(() {
              _sectionIndex = index;
              _currentIndex = index;
            });
          }), 

      );
  }
}

//Myapp


