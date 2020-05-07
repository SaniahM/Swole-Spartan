import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'thread_arg.dart';
import 'threads.dart';

Future<ListView> getThreads(category) async {
  var gen = (await Firestore.instance
          .collection('threads')
          .where('category', isEqualTo: category)
          .orderBy('time', descending: true)
          .getDocuments())
      .documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<HomeThreadClass> threads = List<HomeThreadClass>();
  for (int x = 0; x < gen.length; x++) {
    threads.add(HomeThreadClass(gen[x].data['category'], gen[x].data['title'],
        gen[x].data['init_post']));
  }
  return new Future(() => ListView.builder(
      itemCount: threads.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Card(
            elevation: 3.0,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Container(
              padding: EdgeInsets.only(top: 12, left: 8, right: 8),
              height: 128,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/post',
                      arguments: ThreadArg(
                          gen[index].documentID, threads[index].threadTitle));
                },
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 16.0),
                      Text(threads[index].threadTitle,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: ssFont,
                              color: Colors.orange[500],
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.center,
                    width: 360.0,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(threads[index].threadPost,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                ]),
              ),
            ),
          ),
        );
      }));
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

threadsList(category) {
  return FutureBuilder<ListView>(
      future: getThreads(category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else
          return progressIndicator();
      });
}
