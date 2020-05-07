import 'df_searcharg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'thread_arg.dart';
import 'package:flutter/material.dart';

Future<ListView> getThreadResults(queryPhrase) async{
  var posts = (await Firestore.instance.collection('thread_posts').orderBy('time',descending: true ).getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<SearchArg> threads=List<SearchArg>();
  List<String> postDocs=List<String>();
  for (int x=0;x<posts.length;x++){
    if ((posts[x].data['content'].toLowerCase().contains(queryPhrase.toLowerCase()) || (posts[x].data['title'].toLowerCase().contains(queryPhrase.toLowerCase()))) && !(postDocs.contains(posts[x].documentID))){
      postDocs.add(posts[x].documentID);
      threads.add(SearchArg(posts[x].data['thread'].documentID,posts[x].data['title'],posts[x].data['content']));
    }
  }
  
  List<String> queryWords=queryPhrase.split(' ');
  for(int y=0;y<queryWords.length;y++){
    for (int x=0;x<posts.length;x++){
      if ((posts[x].data['content'].toLowerCase().contains(queryWords[y].toLowerCase()) || (posts[x].data['title'].toLowerCase().contains(queryWords[y].toLowerCase()))) && !(postDocs.contains(posts[x].documentID))){
        postDocs.add(posts[x].documentID);
        threads.add(SearchArg(posts[x].data['thread'],posts[x].data['title'],posts[x].data['content']));
      }
    }
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
                              Navigator.of(context).pushNamed('/post', arguments: ThreadArg(threads[index].docID,threads[index].threadTitle));
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
                                  threads[index].postContent,
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

querylistdf(query){
  return FutureBuilder<ListView> (
    future:getThreadResults(query),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}



Widget dfResultsScreen(BuildContext context, String query){
  return Scaffold(
    
    
    body: Card(
            color: Colors.white,
            elevation: 10,
            margin: EdgeInsets.only(top:8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

//////////////////////////////////////////////////////////////////////////////////////////
/////CHANGE ONLY THIS PART TO FIT ANY SCREEN INTO THE COMMON ITEMS TEMPLATE/////////////
          
            child: Column(
              children:  
                [
                  Padding(padding: EdgeInsets.all(22)),
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(child:querylistdf(query))
                ]  
              
              )

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////      
    ),

    //bottomNavigationBar: FootNavBar(), 

    );
}