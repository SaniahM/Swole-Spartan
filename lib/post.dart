import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'threads.dart';
import 'DF_home.dart';
import 'appbar.dart';
import 'properties.dart';
import 'screens.dart';
import 'drawer.dart';
import 'footnavbar.dart';


class DFPostPage extends StatefulWidget{
  @override
  _DFPostPage createState() => _DFPostPage();
}

class _DFPostPage extends State<DFPostPage>{

  int _currentIndex = 0;
  int _sectionIndex = 0;

  @override
  Widget build(BuildContext context){

    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    return Scaffold(
      
      backgroundColor: Colors.grey[getColor()[0]],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[600], 
      ),

      appBar: topbar(context, getColor()[0], getColor()[1]),
      drawer: drawerFunc(),
      body: Card(
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.only(top:8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))), 
            
              child: Column(
                children: <Widget> 
                [
                  SizedBox(height: 20),
                  
                  Center( 
                    child: Container(
                    child:Text(
                      'General Discussion',
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: ssFont,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount:threads.length,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                        child: Card(
                          child: Container(
                            height: 150,
                            child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Column(
                              children: [
                                Text(
                                  threads[index].postTitle[0],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: ssFont,
                                    color: Colors.orange[500],
                                    fontWeight: FontWeight.bold
                                  )
                                  ),

                                SizedBox(height: 20.0),

                                Expanded(
                                child:  
                                Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                SizedBox(width: 20),
                                Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  threads[index].postDescription[0],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: ssFont,
                                    color: Colors.grey,
                                  )
                                )
                                ),
                                ]
                                ),
                                ),

                              ]
                            ),
                            ),

                          ),
                        ),
                      );
                      
                      }
                      ) 
                  
                  
                  )



                ]
              )

      ),

      bottomNavigationBar: footBar(_sectionIndex, (index){
            setState(() {
              _sectionIndex = index;
              _currentIndex = index;
            });
          }), 

      );
  
  }

}
