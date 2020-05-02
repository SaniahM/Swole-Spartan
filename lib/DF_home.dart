import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'threads.dart';

class DFHomePage extends StatefulWidget{
  @override
  _DFHomePage createState() => _DFHomePage();
}
// List<ThreadClass> threads = [
//       ThreadClass('General Discussion', ['Forum Rules'],
//       ['PakGamers is going to kickstart its first Gaming Night! Don’t know what that is? Its simply like an online party, from your home, with your PG friends, A little bit of “ShoorSharaba” with things flying around (monitor, mouse, abuses, calls, etc). Ok?We’re going to record all of the session to put up on your PakGamers Youtube Channel Lets see if this overflows, it most probably will but wel will make this scrollable hopefully.']),
//       ThreadClass('Workout Discussion', ['Traps Exercises?'], ['Hello']),
//       ThreadClass('Supplements Discussion', ['Whey Protein Brands'], ['Hello']),
//     ];
Future<ListView> getThreadCats() async{
  
  var gen = (await Firestore.instance.collection('threads').where('category',isEqualTo: 'General Discussion').orderBy('time',descending: true ).limit(1).getDocuments()).documents;
  var work = (await Firestore.instance.collection('threads').where('category',isEqualTo: 'Workout Discussion').orderBy('time',descending: true ).limit(1).getDocuments()).documents;
  var sup = (await Firestore.instance.collection('threads').where('category',isEqualTo: 'Supplements Discussion').orderBy('time',descending: true ).limit(1).getDocuments()).documents;
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  List<HomeThreadClass> threads=List<HomeThreadClass>();
  threads.add(HomeThreadClass(gen[0].data['category'],gen[0].data['title'],gen[0].data['init_post']));
  threads.add(HomeThreadClass(work[0].data['category'],work[0].data['title'],work[0].data['init_post']));
  threads.add(HomeThreadClass(sup[0].data['category'],sup[0].data['title'],sup[0].data['init_post']));
  return new Future( ()=> ListView.builder(
                    itemCount: threads.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                        child: Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            height: 150,
                            child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/thread', arguments: threads[index].threadCat);
                            },
                            child: Column(
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      threads[index].threadCat,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: ssFont,
                                        color: Colors.orange[500],
                                        fontWeight: FontWeight.bold
                                      )
                                    ),

                                    SizedBox(width: 10),

                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      ),
                                  ],
                                ),

                                SizedBox(height: 20.0),

                                    Text(
                                      threads[index].threadTitle,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),

                                SizedBox(height: 6.0),

                                Expanded(
                                child:  
                                Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                SizedBox(width: 20),
                                Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  threads[index].threadPost,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: ssFont,
                                    color: Colors.grey,
                                  )
                                )
                                ),
                                ]
                                ),
                                ),

                                SizedBox(height: 15.0),


                              ]
                            ),
                            ),

                          ),
                        ),
                      );
                    },
                  )
                );
         

      
  
}

forumList(){
  return FutureBuilder<ListView> (
    future:getThreadCats(),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}
class _DFHomePage extends State<DFHomePage>{

  @override
  Widget build(BuildContext context){

    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    return Column(
                children:
                [
                  SizedBox(height: 20),

                  Center( 
                    child: Container(
                    child:Text(
                      'DISCUSSION FORUM',
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
                    child: forumList()
                  ),

                ]  
               
    );

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////      
      

  }
  
}
//Myapp


