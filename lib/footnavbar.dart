import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'properties.dart';

BottomNavigationBar footBar(int _currentIndex, void fn(int)){

final fontsize = 12.0;

return BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: fn,
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: 
        [
        BottomNavigationBarItem( //Store 
          icon: Icon(Icons.store,size:24),
          title: Text('Store', style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
          
          ),

        BottomNavigationBarItem( //Video Section
          icon: Icon(Icons.play_arrow, size: 24),
          title: Text('Videos', style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
          
          ),

        BottomNavigationBarItem( //Discussion Forum 
          icon: Icon(Icons.forum, size: 24),
          title: Text('Forum', style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
    
        )
        ], 
        iconSize: 20, 
        
        backgroundColor: Colors.grey[getColor()[0]],
        
        /////////// HERE /////////////////////////
        selectedFontSize: fontsize,
        unselectedFontSize: fontsize,
        
        selectedItemColor: Colors.deepOrange[getColor()[1]],
        selectedIconTheme:IconThemeData(color:Colors.deepOrange[getColor()[1]]),

        unselectedItemColor: Colors.blue[900],
        unselectedIconTheme:IconThemeData(color:Colors.blue[900])
        
        );

}