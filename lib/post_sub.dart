import 'package:flutter/material.dart';
import 'thread_arg.dart';
import 'post_list.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DFPostPageSub extends StatefulWidget{
  @override
  _DFPostPageSub createState() => _DFPostPageSub();
}

class _DFPostPageSub extends State<DFPostPageSub>{

  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  String newPostText;
  var _newPostController = TextEditingController();
  Future<String> getThreadTitle(threadRef) async{
    var threadData = (await threadRef.get());
    return threadData.data['title'];
  }
  Future<String> getUserName(userRef) async{
    var userData = (await userRef.get());
    if (userData!=null){
      return (userData.data['first_name']+ ' ' + userData.data['last_name']);
    }
    return '';
  }
  @override
  Widget build(BuildContext context){
    ThreadArg arg=ModalRoute.of(context).settings.arguments;
    return Column(
                children: <Widget> [

                  SizedBox(height: 20),

                  Center( 
                    child: Container(
                    child:Text(
                      arg.threadTitle,
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: ssFont,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    ),
                  ),

                  SizedBox(height: 30.0),

                  Expanded(
                    child: postsList(arg.docID)

                     
                  
                  ),
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
                                    SizedBox( width: 20.0),
                                    Text(
                                      "New Post",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: ssFont,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold
                                          )

                                    ),
                                  ],
                                ),

                                Container(
                                  width: 330.0,
                                  child: TextFormField(
                                    controller: _newPostController,
                                    onChanged: (val){
                                      setState(() => newPostText = val );
                                    },
                                    cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      labelText: "Please enter your text here...",
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange)
                                    ),
                                  )
                                  )

                                ),

                                SizedBox(height: 35.0),

                                Container(
                                  height: 40.0,
                                  width: 275.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.orangeAccent,
                                    color: Colors.orange,
                                    elevation: 7.0,
                                    child: InkWell( 
                                      hoverColor: Colors.red,
                                      splashColor: Colors.blueAccent,
                                      onTap: () async {
                                        final user = Provider.of<User>(context, listen: false);
                                        var userRef = Firestore.instance.collection('user_records').document(user.uid);
                                        var fullName = await getUserName(userRef);
                                        if (fullName!=''){
                                          //DatabaseService posterData= DatabaseService(uid: user.uid);
                                          //UserData userData= posterData.get
                                          var threadRef = Firestore.instance.collection('threads').document(arg.docID);
                                          var threadTitle = await getThreadTitle(threadRef);
                                          Timestamp time= Timestamp.now();
                                          await Firestore.instance.collection('thread_posts').add({'content':newPostText, 'poster_name': fullName, 'title': threadTitle, 'user': userRef, 'thread': threadRef, 'time': time});
                                          _newPostController.clear();
                                          setState(() {});
                                        }
                                      },
                                          child: Center(
                                            child: Text(
                                              "ENTER POST",
                                              style: TextStyle(
                                                fontFamily: ssFont,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )
                                            ),
                                          )
                                    ),
                                  ),
                                )

                              ],


                            )

                          )
                        )
          
                ]

              );

      
  }
}

