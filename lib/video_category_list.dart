import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<ListView> getCategoryData(category) async{
  
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  var query = (await Firestore.instance.collection('videos').where('video_category', isEqualTo: category).getDocuments()).documents;
  
  List<Map<String,dynamic>> videos = List<Map<String,dynamic>>();
  for(int x=0;x<query.length;x++){
    videos.add(query[x].data);
  }

  return new Future(()=> ListView.builder(

                  itemCount: 3,

                  itemBuilder: (BuildContext context, int index) {
                    int x=index;
                    
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center, 
            
                      children:[

                        Card(
                        elevation: 3.0,
                        child: Column (
                          children: <Widget> [

                          singleItem(
                          context, 
                          videos[x]['video_name'], 
                          videos[x]['video_link'],
                          videos[x]['video_category'], 
                          query[x].documentID,
                          videos[x],
                          index,
                          ),

                          SizedBox(height: 10),

                          Container(
                            alignment: Alignment.center,
                            width: 320,
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                
                                SizedBox(width: 30.0),
                                
                                Expanded(
                                child: 
                                  Text(
                                  videos[x]['video_name'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: ssFont,
                                    // color: Colors.grey,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ),

                                SizedBox(width: 30.0),

                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          ]
                        ),
                        ),    

                        SizedBox(height: 20),                  
                      ]

                  );
                  },
                
                
                  )                );

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

videoCategoryList(category){
  return FutureBuilder<ListView> (
    future:getCategoryData(category),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return progressIndicator();
    }
  );
}

YoutubePlayer singleItem(context, name, link, categories, id, video, first){
        bool _auto = false; 
        
        if(first==0){
          _auto = true;
        }

        return YoutubePlayer(
          width: 320,          
          controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(link),
          flags: YoutubePlayerFlags(
            autoPlay: _auto,
          )
          ),
        );

}

