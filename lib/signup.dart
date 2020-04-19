import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>  {
  
   @override
    Widget build(BuildContext context) {

      String ssFont = 'NeusaNextStf-CompactRegular.otf';

      return new Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[200],
        body: Container(
          child: SingleChildScrollView(
          child: Column(
          children: <Widget>[

            //The header of the application featuring the Sign Up and Log In options.

            Container(              
              child: Row(         
                children: <Widget>[
                  Container(                  
                      padding: EdgeInsets.fromLTRB(25.0, 100.0, 0.0, 0.0), 
                      child: InkWell(
                        child: Text ('Sign Up',
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.blueGrey[600],
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)
                        )
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(80.0, 100.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.grey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)
                      ),
                    )
                  ),
                ],
              ),
            ),

            // A containter containing all the input fields.

            Container(      
              padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
              child: SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  Container(
                    width: 350.0,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[

                        Container(
                          width: 325.0,
                          child: TextField(
                            cursorColor: Colors.amber,
                            cursorWidth: 2.0,
                            decoration: InputDecoration(
                              labelText: "FIRST NAME",
                              labelStyle: TextStyle(
                                fontFamily: ssFont,
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
                              labelText: "LAST NAME",
                              labelStyle: TextStyle(
                                fontFamily: ssFont,
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
                              labelText: "PHONE",
                              labelStyle: TextStyle(
                                fontFamily: ssFont,
                                color: Colors.grey
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
                              labelText: "EMAIL",
                              labelStyle: TextStyle(
                                fontFamily: ssFont,
                                color: Colors.grey
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
                                fontFamily: ssFont,
                                color: Colors.grey
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
                              labelText: "ADDRESS",
                              labelStyle: TextStyle(
                                fontFamily: ssFont,
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

                  // The Sign Up Botton 

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontFamily: ssFont,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            ),
                            Container(
                              // child: ImageIcon(AssetImage('assets/arrow.png')),
                            )
                          ],
                        )
                      ),
                    ),
                  ),

                  SizedBox(height: 15.0),

                ]
              ),
              ),
            ),

            SizedBox(height: 20.0),

            // The text at the bottom
            Container(
            child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text(
                  "By creating an account, you agree to our",
                  style: TextStyle(
                    fontFamily: ssFont,
                    color: Colors.grey
                  )
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text ('Terms of Service and Privacy Policy',
                  style: TextStyle(
                    fontFamily: ssFont,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  )
                  )
                ),
              ]
            ),
              ),
            )
          ],
        ),
          ),
        ),
      );
    }
}