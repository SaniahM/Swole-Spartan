import 'package:flutter/material.dart';
import 'auth.dart';

// Testing.

class FirstNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'First Name cannot be empty' : null;
  }
}

class LastNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Last Name cannot be empty' : null;
  }
}

class PhoneFieldValidator {
  static String validate(String value) {
    if (value.length < 6) {
      return "Invalid Phone Number";
    }
    for (int i = 0; i < value.length; i++) {
      if (aNumber(value[i]) == false) {
        return 'Invalid Phone Number';
      }
    }
    return null;
  }
}

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email Address cannot be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    if (value.length < 8) {
      return "The password must be at least 8 characters long";
    }
    return null;
  }
}

class AddressFieldValidator {
  static String validate(String value) {
    if (value.length < 5) {
      return "The address must be at least 5 characters long";
    }
    return null;
  }
}

// Main body of the code.

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String phone = '';
  String firstName = '';
  String lastName = '';
  String address = '';

  String error = '';
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
                      padding: EdgeInsets.fromLTRB(25.0, 80.0, 0.0, 0.0),
                      child: InkWell(
                          child: Text('Sign Up',
                              style: TextStyle(
                                  fontFamily: ssFont,
                                  color: Colors.blueGrey[600],
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(80.0, 100.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Log In',
                              style: TextStyle(
                                  fontFamily: ssFont,
                                  color: Colors.grey,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ],
                ),
              ),

              // A containter containing all the input fields.

              Container(
                padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
                child: SingleChildScrollView(
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
                          children: <Widget>[
                            Container(
                              width: 325.0,
                              child: TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'First Name cannot be empty'
                                    : null,
                                onChanged: (val) {
                                  setState(() => firstName = val);
                                },
                                cursorColor: Colors.amber,
                                cursorWidth: 2.0,
                                decoration: InputDecoration(
                                    labelText: "FIRST NAME",
                                    labelStyle: TextStyle(
                                      fontFamily: ssFont,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange))),
                              ),
                            ),
                            Container(
                              width: 325.0,
                              child: TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'Last Name cannot be empty'
                                    : null,
                                onChanged: (val) {
                                  setState(() => lastName = val);
                                },
                                cursorColor: Colors.amber,
                                cursorWidth: 2.0,
                                decoration: InputDecoration(
                                    labelText: "LAST NAME",
                                    labelStyle: TextStyle(
                                      fontFamily: ssFont,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange))),
                              ),
                            ),
                            Container(
                              width: 325.0,
                              child: TextFormField(
                                validator: (val) {
                                  if (val.length < 6) {
                                    return "Invalid Phone Number";
                                  }
                                  for (int i = 0; i < val.length; i++) {
                                    if (aNumber(val[i]) == false) {
                                      return 'Invalid Phone Number';
                                    }
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() => phone = val);
                                },
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.amber,
                                cursorWidth: 2.0,
                                decoration: InputDecoration(
                                    labelText: "PHONE",
                                    labelStyle: TextStyle(
                                        fontFamily: ssFont, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange))),
                              ),
                            ),
                            Container(
                              width: 325.0,
                              child: TextFormField(
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Email Address cannot be empty";
                                  }

                                  if (validateNewEmail(val)) {
                                    return null;
                                  }

                                  return 'Invalid Email Address';
                                },
                                onChanged: (val) {
                                  setState(() => error = ' ');
                                  setState(() => email = val);
                                },
                                cursorColor: Colors.amber,
                                cursorWidth: 2.0,
                                decoration: InputDecoration(
                                    labelText: "EMAIL",
                                    labelStyle: TextStyle(
                                        fontFamily: ssFont, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange))),
                              ),
                            ),
                            Container(
                              width: 325.0,
                              child: TextFormField(
                                validator: (val) {
                                  if (val.length < 8) {
                                    return "The password must be at least 8 characters long";
                                  }

                                  List passwordQuality =
                                      validateNewPassword(val);

                                  if (passwordQuality[0] == false) {
                                    return 'The password must contain at least one letter';
                                  }

                                  if (passwordQuality[1] == false) {
                                    return 'The password must contain at least one number';
                                  }

                                  if (passwordQuality[2] == true) {
                                    return 'Allowed characters: letters, numbers, \$, #, @, &, !';
                                  }

                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: true,
                                cursorColor: Colors.amber,
                                cursorWidth: 2.0,
                                decoration: InputDecoration(
                                    labelText: "PASSWORD",
                                    labelStyle: TextStyle(
                                        fontFamily: ssFont, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange))),
                              ),
                            ),
                            Container(
                              width: 325.0,
                              child: TextFormField(
                                validator: (val) {
                                  if (val.length < 5) {
                                    return "The address must be at least 5 characters long";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() => address = val);
                                },
                                cursorColor: Colors.amber,
                                cursorWidth: 2.0,
                                decoration: InputDecoration(
                                    labelText: "ADDRESS",
                                    labelStyle: TextStyle(
                                        fontFamily: ssFont, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange))),
                              ),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
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
                        )

                        // The SignUp Button

                        ),
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
                                dynamic result = await _auth.signUp(
                                    email,
                                    password,
                                    firstName,
                                    lastName,
                                    address,
                                    phone);
                                if (result == null) {
                                  setState(() => error =
                                      'The provided email address is already in use');
                                } else {
                                  Navigator.of(context).pushNamed('/generic');
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text("SIGN UP",
                                      style: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(height: 15.0),
                  ]),
                ),
              ),

              SizedBox(height: 20.0),

              // The text at the bottom
              Container(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("By creating an account, you agree to our",
                            style: TextStyle(
                                fontFamily: ssFont, color: Colors.grey)),
                        InkWell(
                            onTap: () {
                              // Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text('Terms of Service and Privacy Policy',
                                style: TextStyle(
                                    fontFamily: ssFont,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline))),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
