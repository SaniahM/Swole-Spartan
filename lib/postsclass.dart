import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  String content;
  String name;
  String time;
  DocumentReference id;
  DocumentReference threadId;
  String threadTitle;
  Posts(this.content, this.name, this.time, this.id, this.threadId,
      this.threadTitle);
}
