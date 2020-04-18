import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';


AppBar topbar(context, greyShade, deepOrangeShade){
  return AppBar(
  
        backgroundColor: Colors.grey[greyShade],
        elevation: 0,
        iconTheme: IconThemeData(color:Colors.deepOrange[deepOrangeShade],size: 19),
        actionsIconTheme: IconThemeData(color:Colors.deepOrange[deepOrangeShade],size: 19),
        actions: <Widget>[
          Padding( //Search Button
            padding: EdgeInsets.only(right: 180.0),
            child: Icon(Icons.menu) 

          ),
         
          Padding( 
            padding: EdgeInsets.only(right: 0.0),
            child: IconButton(
              iconSize: 19,
              icon: Icon(SpartanIcons.profile) ,
              onPressed: () { 
                          Navigator.of(context).pushNamed('/login');
                        },

            )

          ),
          Padding( 
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(SpartanIcons.sCart) 

          ),
          Padding( 
            padding: EdgeInsets.only(right: 25.0),
            child: Icon(SpartanIcons.search)

          ),
          
          
          ]  
          );

}