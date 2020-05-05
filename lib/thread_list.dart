import 'package:flutter/material.dart';

import 'threads.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

                                    SizedBox(width: 20.0),

                                    Text(
                                      threads[index].threadTitle,
                                      style: TextStyle(
                                        fontSize: 18.0,
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

                                Container(
                                  alignment: Alignment.center,
                                  width: 350.0,
                                  child: Row(
                                    children: <Widget>[
                                      
                                      SizedBox(width: 10.0),
                                      
                                      Expanded(
                                      child: Text(
                                        threads[index].threadPost,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: ssFont,
                                          color: Colors.grey,
                                        )
                                      ),
                                      ),
                                    ],
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

progressIndicator() {
  return Center(
    child: SizedBox(
      height: 40.0,
      width: 40.0,
      child: CircularProgressIndicator(),
    ),
  );
}

threadsList(category){
  return FutureBuilder<ListView> (
    future:getThreads(category),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return progressIndicator();
    }
  );
}
