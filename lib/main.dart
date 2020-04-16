
// This is the code that is executed when the application starts. It features an option to login, and redirects the users to 
// either the sign up screen or the Homescreen of the entire application i.e. the Store Homescreen. 


import 'package:flutter/material.dart';
import 'signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/signup': (BuildContext context) => new SignupPage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: <Widget>[
            Container(              
              child: Row(         
                children: <Widget>[

                  //The header of the application featuring the Sign Up and Log In options.

                  Container( 
                      padding: EdgeInsets.fromLTRB(25.0, 100.0, 0.0, 0.0), 
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text ('Sign Up',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)
                        )
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(80.0, 100.0, 0.0, 0.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.blueGrey[600],
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
              child: Column(
                children: <Widget> [
                  Container(
                    width: 350.0,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Column(

                      // The 'Username/email' and 'Password' fields

                      children: <Widget>[
                        SizedBox(height: 10),
                        Container(
                          width: 325.0,
                          child: TextField(
                            cursorColor: Colors.amber,
                            cursorWidth: 2.0,
                            decoration: InputDecoration(
                              labelText: "USERNAME / EMAIL",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                height: 2.0
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)
                              )  
                            ),
                          ),  
                        ),
                        Container(
                          width: 325.0,
                          child: TextField(
                            cursorColor: Colors.amber,
                            cursorWidth: 2.0,
                            decoration: InputDecoration(
                              labelText: "PASSWORD",
                              labelStyle: TextStyle(
                                color: Colors.grey
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)
                              ) 
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    )
                  ),

                  SizedBox(height: 40.0),

                  // The Log in button:

                  Container(
                    height: 40.0,
                    width: 275.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.orangeAccent,
                      color: Colors.orange,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                            child: Center(
                              child: Text(
                                "LOG IN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            )
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 15.0),

                  // Text at the bottom of the application.

                  Container(
                    child: InkWell(
                      child: Text('Skip',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                      )
                      ),
                    ),
                  )

                ]
              )
            ),

            SizedBox(height: 20.0),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text(
                  "Don't have an account? Swipe right to ",
                  style: TextStyle(
                    color: Colors.grey
                  )
                ),
                // SizedBox(height: 15.0),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text ('Create a new account.',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  )
                  )
                )
              ]
            )
          ],
        ),
      );
    }
}