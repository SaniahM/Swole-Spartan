import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

        child: Column(
        //----------THIS IS WHERE THE Screen specific STUFF GOES---------

          children: [Padding(padding: EdgeInsets.all(22)),carousel(),Padding(padding: EdgeInsets.all(10)),Expanded(child:featuredlist())]

        )),
        
       
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

Widget carousel(){

  return CarouselSlider(
            height: 180.0,
            autoPlay: true,

            
            items: ['A','B','C'].map((i) 
            {
              return Builder( 
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('images/banner/sale.jpeg'),
                        fit: BoxFit.fill

                      )
                    ),
                                      
                  );
                },
              );
            }).toList(),

          );
}

Column halffeaturedlist(){

  return Column(

                    children: [Container(
                      color: Colors.white,
                      height: 100,
                      width: 100,
                      // padding: EdgeInsets.only(top:0,bottom:0,left:30,right:30),

                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                        
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage('images/products/Cellucor.jpg'),
                            fit: BoxFit.fill


                      )
                    
                      ),

                      ),
                      
                      ),
                      Padding(padding: EdgeInsets.only(bottom:10)),

                      Text('Cellucor Cor-', style: TextStyle(fontSize: 15,color: Colors.blue[900]),),
                      Text('Performance isolate', style: TextStyle(fontSize: 12,color: Colors.blue[900]),),
                      Text('Rs 10,500', style: TextStyle(fontSize: 15,color: Colors.deepOrange[900]),),

                      Padding(padding: EdgeInsets.only(bottom:10))
                      ]
                    
                    );

}

DraggableScrollableSheet featuredlist(){
  
return DraggableScrollableSheet(

          builder: (BuildContext context, ScrollController scrollController) {
            return  ListView.builder(
                controller: scrollController,
                itemCount: 10,

                itemBuilder: (BuildContext context, int index) {

                  return Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children:[ halffeaturedlist(), Padding(padding: EdgeInsets.only(left: 70),) ,halffeaturedlist() ]

                );
                },
              
              
              );
          },
      

      );



}