import 'package:flutter/material.dart';
import 'appbar.dart';
import 'drawer.dart';
import 'properties.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'footnavbar.dart';
import 'thread_arg.dart';
import 'postsclass.dart';
Future<ListView> getPosts(threadID) async{
  var threadRef = Firestore.instance.collection('threads').document(threadID);
  var threadData = (await Firestore.instance.collection('thread_posts').where('thread',isEqualTo: threadRef).orderBy('time').getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<Posts> posts=List<Posts>();
  for (int x=0;x<threadData.length;x++){
    Timestamp temp=threadData[x].data['time'];
    posts.add(Posts(threadData[x].data['content'],threadData[x].data['poster_name'],temp.toDate().toString()));
  }
  return new Future( ()=> ListView.builder(
                      itemCount:posts.length+1,
                      itemBuilder: (context, index) {
                      
                      if (index == posts.length) {
                        return Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            height: 200,
                            child: Column(
                              children: <Widget>[

                                SizedBox(height: 20),

                                Row(
                                  children: <Widget>[
                                    SizedBox( width: 20.0),
                                    Text(
                                      "New Post",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: ssFont,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold
                                          )

                                    ),
                                  ],
                                ),

                                Container(
                                  width: 330.0,
                                  child: TextFormField(
                                    cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      labelText: "Please enter your text here...",
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange)
                                    ),
                                  )
                                  )

                                ),

                                SizedBox(height: 35.0),

                                Container(
                                  height: 40.0,
                                  width: 275.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.orangeAccent,
                                    color: Colors.orange,
                                    elevation: 7.0,
                                    child: InkWell( 
                                      hoverColor: Colors.red,
                                      splashColor: Colors.blueAccent,
                                      onTap: () {},
                                          child: Center(
                                            child: Text(
                                              "ENTER POST",
                                              style: TextStyle(
                                                fontFamily: ssFont,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )
                                            ),
                                          )
                                    ),
                                  ),
                                )

                              ],


                            )

                          )
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
                        child: Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            height: 300,
                            child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/post');
                            },
                            child: Column(
                              children: [

                                SizedBox(height: 10),
                                
                                Row(
                                  children: <Widget>[
                                    
                                    SizedBox(width: 10.0),

                                    Text(
                                      posts[index].name,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold
                                      )
                                      ),

                                    SizedBox(width: 200.0),
                                    
                                    Text(
                                      posts[index].time,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      )
                                    )
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
                                  posts[index].content,
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

                                Row(
                                  children: <Widget>[

                                    SizedBox(width: 280.0),
                                    
                                    InkWell(
                                      onTap: () {},
                                      child: Text (
                                        'Report Post',
                                        style: TextStyle(
                                          fontFamily: ssFont,
                                          color: Colors.grey,
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    )
                                  ],
                                ),

                                SizedBox(height: 10),

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

postsList(threadID){
  return FutureBuilder<ListView> (
    future:getPosts(threadID),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}

class DFPostPage extends StatefulWidget{
  @override
  _DFPostPage createState() => _DFPostPage();
}

class _DFPostPage extends State<DFPostPage>{
  int _currentIndex = 0;
  int _sectionIndex = 0;
  @override
  Widget build(BuildContext context){
    ThreadArg arg=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      
      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1]),
      drawer: drawerFunc(),
      body: Card(
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.only(top:8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

            
              child: Column(
                children: <Widget> [

                  SizedBox(height: 20),

                  Center( 
                    child: Container(
                    child:Text(
                      arg.threadTitle,
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
                    child: postsList(arg.docID)

                     
                  
                  ),
                                    
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

//Myapp


