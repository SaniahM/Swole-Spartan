import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'threads.dart';


Future<ListView> getThreadCats() async{
  
  var gen = (await Firestore.instance.collection('threads').where('category',isEqualTo: 'General Discussion').orderBy('time',descending: true ).limit(1).getDocuments()).documents;
  var work = (await Firestore.instance.collection('threads').where('category',isEqualTo: 'Workout Discussion').orderBy('time',descending: true ).limit(1).getDocuments()).documents;
  var sup = (await Firestore.instance.collection('threads').where('category',isEqualTo: 'Supplements Discussion').orderBy('time',descending: true ).limit(1).getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<HomeThreadClass> threads=List<HomeThreadClass>();
  threads.add(HomeThreadClass(gen[0].data['category'],gen[0].data['title'],gen[0].data['init_post']));
  threads.add(HomeThreadClass(work[0].data['category'],work[0].data['title'],work[0].data['init_post']));
  threads.add(HomeThreadClass(sup[0].data['category'],sup[0].data['title'],sup[0].data['init_post']));

  return new Future( ()=> ListView.builder(
                    itemCount: threads.length,
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
                              Navigator.of(context).pushNamed('/thread', arguments: threads[index].threadCat);
                            },
                            child: Column(
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    SizedBox(width: 12.0),

                                    Text(
                                      threads[index].threadCat,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: ssFont,
                                        color: Colors.orange[500],
                                        fontWeight: FontWeight.bold
                                      )
                                    ),

                                    SizedBox(width: 10),

                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      ),
                                  ],
                                ),

                                SizedBox(height: 16.0),

                                    Text(
                                      threads[index].threadTitle,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline,
                                        // fontWeight: FontWeight.bold
                                      )
                                    ),

                                SizedBox(height: 10.0),

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
                                            ),
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
                    },
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

forumList(){
  return FutureBuilder<ListView> (
    future:getThreadCats(),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return progressIndicator();
    }
  );
}