import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'threads.dart';
import 'appbar.dart';
import 'properties.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'screens.dart';
import 'drawer.dart';
import 'footnavbar.dart';
import 'thread_arg.dart';

Future<ListView> getThreads(category) async{
  
  var gen = (await Firestore.instance.collection('threads').where('category',isEqualTo: category).orderBy('time',descending: true ).getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<HomeThreadClass> threads=List<HomeThreadClass>();
  for (int x=0;x<gen.length;x++){
    threads.add(HomeThreadClass(gen[x].data['category'],gen[x].data['title'],gen[x].data['init_post']));
  }
  return new Future( ()=> ListView.builder(
                      itemCount:threads.length,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                        child: Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            height: 150,
                            child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/post', arguments: ThreadArg(gen[index].documentID,threads[index].threadTitle));
                            },
                            child: Column(
                              children: [


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    Text(
                                      threads[index].threadTitle,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: ssFont,
                                        color: Colors.orange[500],
                                        fontWeight: FontWeight.bold
                                      )
                                      ),

                                    SizedBox( width: 20),

                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      ),
                                  ],
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
                                  threads[index].threadPost,
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

                                SizedBox(height: 20.0),



                              ]
                            ),
                            ),

                          ),
                        ),
                      );
                      
                      }
                      ) 
                );
         

      
  
}

threadsList(category){
  return FutureBuilder<ListView> (
    future:getThreads(category),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}

class DFThreadPage extends StatefulWidget{
  @override
  _DFThreadPage createState() => _DFThreadPage();
}

class _DFThreadPage extends State<DFThreadPage>{

  int _currentIndex = 0;
  int _sectionIndex = 0;
  @override
  Widget build(BuildContext context){

    String ssFont = 'NeusaNextStf-CompactRegular.otf';
    String category = ModalRoute.of(context).settings.arguments;

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
                      category,
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: ssFont,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    ),
                  ),

                  SizedBox(height: 30.0),

                  Expanded(
                    child: threadsList(category)
                  
                  
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
