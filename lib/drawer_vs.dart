import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String ssFont = 'NeusaNextStf-CompactRegular.otf';

Future<ListView> vsCategoryList() async {
  var query = (await Firestore.instance.collection('videos').getDocuments()).documents;
  List<String> uniqueCats=List<String>();
  for(int x=0;x<query.length;x++){
    if (!uniqueCats.contains(query[x].data['video_category']))uniqueCats.add(query[x].data['video_category']);
  }
  return new Future( ()=> ListView.builder(
    itemCount: uniqueCats.length,
    itemBuilder: (BuildContext context, int index) {
      if (index==0)
        return Column(
          children:<Widget>[ 
            SizedBox(height: 100),

            Row(
            children: <Widget>[
             SizedBox(width: 30),
             InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/vscategories', arguments: uniqueCats[index]);
                      },
                      child: Text(
                        uniqueCats[index],
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.grey[600],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold


                          )
                      ),
                    ),


            ]
            ),

            SizedBox(height: 20)
          ]);
          else return Column(
          children:<Widget>[ 
            Row(
            children: <Widget>[
             SizedBox(width: 30),
             InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/vscategories', arguments: uniqueCats[index]);
                      },
                      child: Text(
                        uniqueCats[index],
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.grey[600],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)
                      ),
                    ),


            ]
            ),

            SizedBox(height: 20)
          ]);
          
      }             
    )
    );
}

getVsCats(){
   return FutureBuilder<ListView> (
    future:vsCategoryList(),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}

ClipRRect vsDrawerFunc() {

  return ClipRRect(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(700), topRight: Radius.circular(0), ),
    child: Drawer(
    child: Container(
      color: Colors.white,
        child: getVsCats()
    ),
    ),
  );

}