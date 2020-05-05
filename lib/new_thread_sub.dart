import 'package:SwoleSpartan/thread_arg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DFNewThreadPageSub extends StatefulWidget{
  @override
  _DFNewThreadPageSub createState() => _DFNewThreadPageSub();
}

class _DFNewThreadPageSub extends State<DFNewThreadPageSub>{
String ssFont = 'NeusaNextStf-CompactRegular.otf';
String threadTitle;
String threadContent;
  Future<String> getThreadTitle(threadRef) async{
    var threadData = (await threadRef.get());
    return threadData.data['thread_title'];
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
    String category = ModalRoute.of(context).settings.arguments;

    return SingleChildScrollView(
      child: Column(
                
                children: <Widget>[

                  SizedBox(height: 20),

                  Center(
                    child: Text(
                      "NEW THREAD",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: ssFont,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),


                  Card(
                    elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                          height: 400.0,
                          width: 330.0,
                          child: Column(children: <Widget> [

                          SizedBox(height: 30.0),


                          Container(
                            child: Text(
                              "THREAD TITLE",
                              style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: ssFont,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                              )
                            )
                          ), 
                          
                          Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(() => threadTitle = val );
                                    },
                                    cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: "Please enter your text here...",
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                      ),
                                      helperMaxLines: 100,
                                      focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange)
                                    ),
                                  )
                                  )

                                ),

                            SizedBox(height: 30.0),

                            Container(
                            child: Text(
                              "INITIAL POST",
                              style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: ssFont,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                              )
                            )
                          ), 
                          
                          Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(() => threadContent = val );
                                    },
                                    cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    autofocus: false,
                                    maxLines: null,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "Please enter your text here...",
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

                          ]),

                          ),

                  ),

                  SizedBox(height: 10.0),

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
                              Timestamp time= Timestamp.now();
                              var threadRef= await Firestore.instance.collection('threads').add({'category':category, 'created_by': userRef, 'init_post': threadContent,'time':time,'title':threadTitle});
                              await Firestore.instance.collection('thread_posts').add({'content':threadContent, 'poster_name': fullName, 'title': threadTitle, 'user': userRef, 'thread': threadRef, 'time': time});
                              Navigator.of(context).pushNamed('/post', arguments: ThreadArg(threadRef.documentID,threadTitle));
                            }
                        },
                            child: Center(
                              child: Text(
                                "CREATE THREAD",
                                style: TextStyle(
                                  fontFamily: ssFont,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            )
                      ),
                    ),
                  ),

                  SizedBox(height: 200.0),

                ],
     ) );
              
  }
}

//Myapp


