import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'auth.dart';

String ssFont = 'NeusaNextStf-CompactRegular.otf';


ClipRRect drawer_func() {

  return ClipRRect(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(700), topRight: Radius.circular(700),),
    child: Drawer(
    child: Container(
      color: Colors.white,
        child: ListView(
          children: <Widget> [
            
            SizedBox(height: 200),

            Row(
            children: <Widget>[
             SizedBox(width: 20),
             InkWell(
                      onTap: () {

                      },
                      child: Text(
                        'Item 1',
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.grey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)
                      ),
                    ),
            SizedBox(width: 100), 
            Icon(
              Icons.arrow_right,
              size: 40,
              color: Colors.grey,
            ),

            ]
            ),

            SizedBox(height: 10),

            Row(
            children: <Widget>[
             SizedBox(width: 20),
             InkWell(
                      onTap: () {

                      },
                      child: Text(
                        'Item 1',
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.grey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)
                      ),
                    ),
            SizedBox(width: 100), 
            Icon(
              Icons.arrow_right,
              size: 40,
              color: Colors.grey,
            ),
            ]
            ),
          ]        
        ),
    ),
    ),
  );

}