import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'properties.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<ListView> getQueryData(queryPhrase) async{
  
  var query = (await Firestore.instance.collection('videos').getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  int itcount = 3;
  List<Map<String,dynamic>> videos = List<Map<String,dynamic>>();
  List<String> vidDocs=List<String>();


    for (int x=0;x<query.length;x++){
      if (((query[x].data['video_name'].toLowerCase().contains(queryPhrase.toLowerCase()))) && !(vidDocs.contains(query[x].documentID))){
        vidDocs.add(query[x].documentID);
        videos.add(query[x].data);
      }
    }
    
    List<String> queryWords=queryPhrase.split(' ');
    for(int y=0;y<queryWords.length;y++){
      for (int x=0;x<query.length;x++){
        if (((query[x].data['video_name'].toLowerCase().contains(queryWords[y].toLowerCase()))) && !(vidDocs.contains(query[x].documentID))){
          vidDocs.add(query[x].documentID);
          videos.add(query[x].data);
        }
      }
    }

      if(itcount > vidDocs.length){
        itcount = vidDocs.length;
    }

      return new Future(()=> ListView.builder(

                  itemCount: itcount,

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

queryListVs(query){
  return FutureBuilder<ListView> (
    future:getQueryData(query),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
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

