import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'properties.dart';

class FootNavBar extends StatefulWidget{
 
  @override
  _FootNavigation createState() => _FootNavigation();

}

class _FootNavigation extends State<FootNavBar>{

  //Foot Navigation Bar update
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context){

  return BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: 
        [
        BottomNavigationBarItem( //Store 
          icon: Icon(SpartanIcons.store), 
          title: Text('')
          
          ),

        BottomNavigationBarItem( //Video Section
          icon: Icon(SpartanIcons.vSection), 
          title: Text('')
          
          ),

        BottomNavigationBarItem( //Discussion Forum 
          icon: Icon(SpartanIcons.dForum), 
          title: Text('')
    
        )
        ], 
        iconSize: 20, 
        backgroundColor: Colors.grey[getColor()[0]],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedIconTheme:IconThemeData(color:Colors.deepOrange[getColor()[1]]),
        unselectedIconTheme:IconThemeData(color:Colors.blue[900]));

}
}