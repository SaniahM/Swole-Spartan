import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';


AppBar topbar(context, greyShade, deepOrangeShade){
  return AppBar(
  
        backgroundColor: Colors.grey[greyShade],
        elevation: 0,
        iconTheme: IconThemeData(color:Colors.deepOrange[deepOrangeShade],size: 19),
        actionsIconTheme: IconThemeData(color:Colors.deepOrange[deepOrangeShade],size: 19),
        actions: <Widget>[
          Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Center(
                child: IconButton(
                  iconSize: 19,
                  icon: Icon(Icons.menu),
                  onPressed: () { 
                    Navigator.of(context).pushNamed('/sidemenu');
                  },
                )
              ),

              SizedBox(width: 150.0),

              Center(
                child: IconButton(
                  iconSize: 19,
                  icon: Icon(SpartanIcons.profile) ,
                  onPressed: () { 
                    Navigator.of(context).pushNamed('/profile');
                  },
                )
              ),

              Center(
                child: IconButton(
                  iconSize: 19,
                  icon: Icon(SpartanIcons.sCart),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cart');
                  },
                )
              ),

              Center(
                child: IconButton(
                  iconSize: 19,
                  icon: Icon(SpartanIcons.search),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/searchbar');
                  },
                )
              ),

              SizedBox(width: 20.0),

            ], 

          ),
          ),
          
        ]  
  );

}