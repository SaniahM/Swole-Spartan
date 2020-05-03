import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'review.dart';
import 'storescreenarg.dart';

Future<ListView> getReviews(id) async{

  var review = (await Firestore.instance.collection('reviews').where('product_id',isEqualTo: id ).getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<ReviewClass> reviewList =List<ReviewClass>();

  for(int x=0;x<review.length;x++){
    reviewList.add(ReviewClass(review[x].data['product_id'],review[x].data['user_name'],review[x].data['review']));
  }
  if (reviewList.isEmpty) {
    return new Future(() =>
        ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('There are no reviews for this product yet',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: ssFont,
                ),
              ),
            );
          },
        )
    );
  }
  else {
    return new Future(() =>
        ListView.builder(
          itemCount: reviewList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person_outline,
                  color: Colors.orange,
                ),
                backgroundColor: Colors.grey[300],
              ),
              title: Text(reviewList[index].name),
              subtitle: Text(reviewList[index].reviewText),
              enabled: false,
            );
          },
        )
    );
  }
}

reviewList(id){
  return FutureBuilder<ListView> (
      future: getReviews(id),
      builder: (context,snapshot){
        if (snapshot.hasData){
          return snapshot.data;
        }
        else return CircularProgressIndicator();
      }
  );
}

