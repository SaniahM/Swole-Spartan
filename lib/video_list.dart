import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'properties.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<DraggableScrollableSheet> getdata() async{
  
  var query = (await Firestore.instance.collection('videos').limit(8).getDocuments()).documents;
  
  List<Map<String,dynamic>> videos = List<Map<String,dynamic>>();
  for(int x=0;x<query.length;x++){
    videos.add(query[x].data);
  }

  return new Future(()=> DraggableScrollableSheet(

          initialChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
           
              return  ListView.builder(

                  controller: scrollController,
                  itemCount: 5,

                  itemBuilder: (BuildContext context, int index) {
                    int x=index;
                    
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center, 
            
                      children:[ 
                        singleItem(
                          context, 
                          videos[x]['video_name'], 
                          videos[x]['video_link'],
                          videos[x]['video_category'], 
                          query[x].documentID,
                          videos[x]),

                          SizedBox(height: 40,) 
                      ]

                  );
                  },
                
                
                );
          },
      

      )
  );
}

videolist(){
  return FutureBuilder<DraggableScrollableSheet> (
    future:getdata(),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}

YoutubePlayer singleItem(context, name, link, categories, id, video){

        return YoutubePlayer(
          width: 320,          
          controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(link),
          flags: YoutubePlayerFlags(
            autoPlay: false,
          )
          ),
        );

}

