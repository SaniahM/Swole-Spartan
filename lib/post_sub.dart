import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'posts_class.dart';
import 'thread_arg.dart';
import 'user.dart';


class DFPostPageSub extends StatefulWidget {
  @override
  _DFPostPageSub createState() => _DFPostPageSub();
}

class _DFPostPageSub extends State<DFPostPageSub> {
  List<String> reportTexts = [];

  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  String newPostText;
  var _newPostController = TextEditingController();

  Future<ListView> getPosts(threadID) async {
    var threadRef = Firestore.instance.collection('threads').document(threadID);
    var threadData = (await Firestore.instance
            .collection('thread_posts')
            .where('thread', isEqualTo: threadRef)
            .orderBy('time')
            .getDocuments())
        .documents;
    String ssFont = 'NeusaNextStf-CompactRegular.otf';
    List<Posts> posts = List<Posts>();
    for (int x = 0; x < threadData.length; x++) {
      String temp = (DateFormat('dd-MM-yyyy – kk:mm')
          .format(threadData[x].data['time'].toDate()));
      posts.add(Posts(
          threadData[x].data['content'],
          threadData[x].data['poster_name'],
          temp,
          threadData[x].reference,
          threadRef,
          threadData[x].data['title']));
    }
    for (int i = 0; i < posts.length; i++) {
      reportTexts.add("Report Post");
    }
    return new Future(() => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
            child: Card(
              elevation: 3.0,
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 240,
                child: Column(children: [
                  SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 16.0),
                      Text(posts[index].name,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: ssFont,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 16.0),
                      Text(posts[index].time,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: ssFont,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    alignment: Alignment.center,
                    width: 350.0,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(posts[index].content,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 280.0),
                      InkWell(
                          onTap: () {
                            Firestore.instance.collection('reports').add({
                              'post': posts[index].content,
                              'post_id': posts[index].id,
                              'thread_id': posts[index].threadId,
                              'thread_title': posts[index].threadTitle
                            });
                            setState(() {
                              reportTexts[index] = "Reported";
                            });
                          },
                          child: Text(
                            reportTexts[index],
                            style: TextStyle(
                              fontFamily: ssFont,
                              color: Colors.red[700],
                              decoration: TextDecoration.underline,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 5.0),
                ]),
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

  postsList(threadID) {
    return FutureBuilder<ListView>(
        future: getPosts(threadID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else
            return progressIndicator();
        });
  }

  Future<String> getThreadTitle(threadRef) async {
    var threadData = (await threadRef.get());
    return threadData.data['title'];
  }

  Future<String> getUserName(userRef) async {
    var userData = (await userRef.get());
    if (userData != null) {
      return (userData.data['first_name'] + ' ' + userData.data['last_name']);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<User>(context);
    if (user != null) {
      String loginText;
      Color floatColor;

      if (user.status == false) {
        loginText = "Create Post";
        floatColor = Colors.orange[600];
      } else {
        loginText = "Log in to post";
        floatColor = Colors.grey;
      }
      ThreadArg arg = ModalRoute.of(context).settings.arguments;
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Center(
          child: Container(
            child: Text(
              arg.threadTitle,
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: ssFont,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 30.0),
        Expanded(child: postsList(arg.docID)),
        Card(
            elevation: 3.0,
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Container(
                height: 200,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Text("New Post",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: ssFont,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Container(
                        width: 330.0,
                        child: TextFormField(
                            controller: _newPostController,
                            onChanged: (val) {
                              setState(() => newPostText = val);
                            },
                            cursorColor: Colors.amber,
                            cursorWidth: 2.0,
                            decoration: InputDecoration(
                              // labelText: "Please enter your text here...",
                              hintText: "Please enter your text here...",
                              labelStyle: TextStyle(
                                fontFamily: ssFont,
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                            ))),
                    SizedBox(height: 35.0),
                    Container(
                      height: 35.0,
                      width: 275.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.orangeAccent,
                        color: floatColor,
                        elevation: 7.0,
                        child: InkWell(
                            hoverColor: Colors.red,
                            splashColor: Colors.blueAccent,
                            onTap: () async {
                              if (user != null) {
                                if (user.status == false) {
                                  final user =
                                      Provider.of<User>(context, listen: false);
                                  var userRef = Firestore.instance
                                      .collection('user_records')
                                      .document(user.uid);
                                  var fullName = await getUserName(userRef);
                                  if (fullName != '') {
                                    //DatabaseService posterData= DatabaseService(uid: user.uid);
                                    //UserData userData= posterData.get
                                    var threadRef = Firestore.instance
                                        .collection('threads')
                                        .document(arg.docID);
                                    var threadTitle =
                                        await getThreadTitle(threadRef);
                                    Timestamp time = Timestamp.now();
                                    await Firestore.instance
                                        .collection('thread_posts')
                                        .add({
                                      'content': newPostText,
                                      'poster_name': fullName,
                                      'title': threadTitle,
                                      'user': userRef,
                                      'thread': threadRef,
                                      'time': time
                                    });
                                    _newPostController.clear();
                                    // setState(() {});
                                  }
                                  setState(() {});
                                } else {
                                  await _auth.signOut();
                                  Navigator.of(context).pushNamed('/login');
                                }
                              } else {
                                Navigator.of(context).pushNamed('/login');
                              }
                            },
                            child: Center(
                              child: Text(loginText,
                                  style: TextStyle(
                                    fontFamily: ssFont,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                      ),
                    )
                  ],
                )))
      ]);
    } else {
      return Scaffold();
    }
  }
}
