import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'postsclass.dart';



Future<ListView> getPosts(threadID) async{
  var threadRef = Firestore.instance.collection('threads').document(threadID);
  var threadData = (await Firestore.instance.collection('thread_posts').where('thread',isEqualTo: threadRef).orderBy('time').getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<Posts> posts=List<Posts>();
  for (int x=0;x<threadData.length;x++){
    String temp=DateTime.parse((threadData[x].data['time']).toDate).toString();
    posts.add(Posts(threadData[x].data['content'],threadData[x].data['poster_name'],temp,threadData[x].reference,threadRef,threadData[x].data['title']));
  }
  return new Future( ()=> ListView.builder(
                      itemCount:posts.length,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
                        child: Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            height: 300,
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
                                      onTap: () {
                                        Firestore.instance.collection('reports').add({'post': posts[index].content, 'post_id': posts[index].id, 'thread_id': posts[index].threadId,'thread_title': posts[index].threadTitle});
                                      },
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
