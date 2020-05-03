import 'package:cloud_firestore/cloud_firestore.dart';

class PostReview{

  final String reviewDocId;
  PostReview(this.reviewDocId);

  final CollectionReference reviews = Firestore.instance.collection('reviews');

  Future newReview(String productId, String name, String reviewText) async {
    return await reviews.document(reviewDocId).setData({
      'product_id': productId,
      'user_name': name,
      'review' : reviewText,
    });
  }
}



