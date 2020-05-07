import 'package:flutter/material.dart';

import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
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
                            // Navigator.of(context).pushNamed('/product_details_main');
                          },
                          child: Text('Sign Up',
                              style: TextStyle(
                                  fontFamily: ssFont,
                                  fontSize: 30.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(80.0, 80.0, 0.0, 0.0),
                      child: Text('Log In',
                          style: TextStyle(
                              fontFamily: ssFont,
                              color: Colors.blueGrey[600],
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
                  child: Column(children: <Widget>[
                    Container(
                      width: 350.0,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            // The 'Username/email' and 'Password' fields

                            children: <Widget>[
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.only(top: 0),
                                width: 325.0,
                                child: TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? 'You need to provide an email to log in'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => error = ' ');
                                    setState(() => email = val);
                                  },
                                  cursorColor: Colors.amber,
                                  cursorWidth: 2.0,
                                  decoration: InputDecoration(
                                      labelText: "USERNAME / EMAIL",
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
                                ),
                              ),
                              Container(
                                width: 325.0,
                                child: TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? 'You need to provide a password to log in'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  obscureText: true,
                                  cursorColor: Colors.amber,
                                  cursorWidth: 2.0,
                                  decoration: InputDecoration(
                                      labelText: "PASSWORD",
                                      labelStyle: TextStyle(
                                          fontFamily: ssFont,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          )),
                    ),

                    SizedBox(height: 20.0),

                    Container(
                        height: 30.0,
                        width: 275.0,
                        child: Text(
                          error,
                          style: TextStyle(
                            color: Colors.red[600],
                            fontFamily: ssFont,
                          ),
                        )),

                    // The Log in button:

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
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _auth.logIn(email, password);
                                if (result == null) {
                                  setState(() => error =
                                      'Kindly provide a valid email and password');
                                } else {
                                  Navigator.of(context).pushNamed('/generic');
                                }
                              }
                            },
                            child: Center(
                              child: Text("LOG IN",
                                  style: TextStyle(
                                    fontFamily: ssFont,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                      ),
                    ),

                    SizedBox(height: 15.0),

                    // Text at the bottom of the application.

                    Container(
                      child: InkWell(
                        onTap: () async {
                          dynamic result = await _auth.guestSignIn();

                          if (result == null) {
                            // HERE GOES THE INVALID LOGIN ERROR
                          } else {
                            Navigator.of(context).pushNamed('/generic');
                          }
                        },
                        child: Text('Skip',
                            style: TextStyle(
                                fontFamily: ssFont,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      ),
                    )
                  ])),

              SizedBox(height: 20.0),

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account? Swipe right to ",
                        style:
                            TextStyle(fontFamily: ssFont, color: Colors.grey)),
                    // SizedBox(height: 15.0),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text('Create a new account.',
                            style: TextStyle(
                                fontFamily: ssFont,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)))
                  ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
