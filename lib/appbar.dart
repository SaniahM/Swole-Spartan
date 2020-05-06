import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'search_bar.dart';
import 'search_bar_df.dart';
import 'search_bar_vs.dart';
import 'auth.dart';

import 'package:provider/provider.dart';
import 'user.dart';

AppBar topbar(context, greyShade, deepOrangeShade, sectionIndex){
final AuthService _auth = AuthService();
final user = Provider.of<User>(context);
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

              SizedBox(width: 150.0),

              Center(
                child: IconButton(
                  iconSize: 19,
                  icon: Icon(SpartanIcons.profile) ,
                  onPressed: ()  async{       
                      if(user != null){

                        if(user.status == false){ // The user is logged in

                         Navigator.of(context).pushNamed('/profile');
                        
                        }
                        else{ //The user is in guest mode
                        await _auth.signOut();
                        Navigator.of(context).pushNamed('/login');
                        }
                      
                      }
                      else{

                        Navigator.of(context).pushNamed('/login');
                      }

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
                    if(sectionIndex == 0){
                      showSearch(context: context, delegate: SearchBarPage());
                    }
                    else if(sectionIndex == 1){
                      showSearch(context: context, delegate: SearchBarPageVs());
                    }
                    else if(sectionIndex==2){
                      showSearch(context: context, delegate: SearchBarPageDf());
                    }

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