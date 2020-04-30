import 'package:flutter/material.dart';
import 'appbar.dart';
import 'drawer.dart';
import 'drawer.dart';
import 'properties.dart';
import 'drawer.dart';
import 'footnavbar.dart';
import 'DF_home.dart';

class DFPostPage extends StatefulWidget{
  @override
  _DFPostPage createState() => _DFPostPage();
}

class _DFPostPage extends State<DFPostPage>{
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

            
              child: Column(
                children: <Widget> [

                  SizedBox(height: 20),

                  Center( 
                    child: Container(
                    child:Text(
                      'Looking for gyms in DHA',
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: ssFont,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    ),
                  ),

                  SizedBox(height: 30.0),

                  Expanded(
                    child: ListView.builder(
                      itemCount:threads.length,
                      itemBuilder: (context, index) {
                      
                      if (index == threads.length - 1) {
                        return Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            height: 200,
                            child: Column(
                              children: <Widget>[

                                SizedBox(height: 20),

                                Row(
                                  children: <Widget>[
                                    SizedBox( width: 20.0),
                                    Text(
                                      "New Post",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: ssFont,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold
                                          )

                                    ),
                                  ],
                                ),

                                Container(
                                  width: 330.0,
                                  child: TextFormField(
                                    cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      labelText: "Please enter your text here...",
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

                                SizedBox(height: 35.0),

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
                                      onTap: () {},
                                          child: Center(
                                            child: Text(
                                              "ENTER POST",
                                              style: TextStyle(
                                                fontFamily: ssFont,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )
                                            ),
                                          )
                                    ),
                                  ),
                                )

                              ],


                            )

                          )
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
                        child: Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            height: 300,
                            child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/post');
                            },
                            child: Column(
                              children: [

                                SizedBox(height: 10),
                                
                                Row(
                                  children: <Widget>[
                                    
                                    SizedBox(width: 10.0),

                                    Text(
                                      "User_name",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold
                                      )
                                      ),

                                    SizedBox(width: 200.0),
                                    
                                    Text(
                                      "date",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      )
                                    )
                                  ],
                                ),

                                SizedBox(height: 20.0),

                                Expanded(
                                child:  
                                Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                SizedBox(width: 20),
                                Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  threads[index].postDescription[0],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: ssFont,
                                    color: Colors.grey,
                                  )
                                )
                                ),
                                ]
                                ),
                                ),

                                SizedBox(height: 20.0),

                                Row(
                                  children: <Widget>[

                                    SizedBox(width: 280.0),
                                    
                                    InkWell(
                                      onTap: () {},
                                      child: Text (
                                        'Report Post',
                                        style: TextStyle(
                                          fontFamily: ssFont,
                                          color: Colors.grey,
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    )
                                  ],
                                ),

                                SizedBox(height: 10),

                              ]
                            ),
                            ),

                          ),
                        ),
                      );
                      
                      }
                      )

                     
                  
                  ),
                                    
                ]

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


