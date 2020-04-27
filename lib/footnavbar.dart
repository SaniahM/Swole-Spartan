import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'properties.dart';

BottomNavigationBar footBar(int _currentIndex, void fn(int)){


return BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: fn,
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: 
        [
        BottomNavigationBarItem( //Store 
          icon: Icon(SpartanIcons.store), 
          title: Text('Store', style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
          
          ),

        BottomNavigationBarItem( //Video Section
          icon: Icon(SpartanIcons.vSection), 
          title: Text('Videos', style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
          
          ),

        BottomNavigationBarItem( //Discussion Forum 
          icon: Icon(SpartanIcons.dForum), 
          title: Text('Forum', style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
    
        )
        ], 
        iconSize: 20, 
        
        backgroundColor: Colors.grey[getColor()[0]],
        selectedFontSize: 15,
        unselectedFontSize: 0,
        selectedItemColor: Colors.deepOrange[getColor()[1]],
        selectedIconTheme:IconThemeData(color:Colors.deepOrange[getColor()[1]]),
        unselectedIconTheme:IconThemeData(color:Colors.blue[900])
        
        );

}