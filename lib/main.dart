import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      home: Home()
    );


  }//build

}

class Home extends StatefulWidget{
 
  @override
  _CommonItemsEmpty createState() => _CommonItemsEmpty();

}



class _CommonItemsEmpty extends State<Home>{

  //Foot Navigation Bar update
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context){

    //Set Colors from here    
    int deepOrangeShade = 300;
    int greyShade = 300;

    return Scaffold(
      
      backgroundColor: Colors.grey[greyShade],

      appBar: AppBar(
  
        backgroundColor: Colors.grey[greyShade],
        elevation: 0,
        iconTheme: IconThemeData(color:Colors.deepOrange[deepOrangeShade],size: 19),
        actions: <Widget>[
          Padding( //Search Button
            padding: EdgeInsets.only(right: 235.0),
            child: Icon(Icons.menu) 
            //IconButton(icon: Icon(Icons.menu)). 
            // Icons in appbar to be replaced by iconbuttons as soon
            // as we have actions available
          ),
         
          Padding( 
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(SpartanIcons.profile) 

          ),
          Padding( 
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(SpartanIcons.sCart) 

          ),
          Padding( 
            padding: EdgeInsets.only(right: 25.0),
            child: Icon(SpartanIcons.search)

          ),
          
          
          ]  
          ),
       
      body: Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.only(top:8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        
        child: Center(
        //----------THIS IS WHERE MOST OF THE STUFF GOES---------
        ), 
        ),
       
      bottomNavigationBar: BottomNavigationBar(
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
        backgroundColor: Colors.grey[greyShade],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedIconTheme:IconThemeData(color:Colors.deepOrange[deepOrangeShade]),
        unselectedIconTheme:IconThemeData(color:Colors.blue[900])),

      );
  }
}

//Myapp

