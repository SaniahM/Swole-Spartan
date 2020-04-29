import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'threads.dart';

class DFHomePage extends StatefulWidget{
  @override
  _DFHomePage createState() => _DFHomePage();
}

List<ThreadClass> threads = [
      ThreadClass('General Discussion', ['Forum Rules', 'Ramzan Tournament'],
      ['PakGamers is going to kickstart its first Gaming Night! Don’t know what that is? Its simply like an online party, from your home, with your PG friends, A little bit of “ShoorSharaba” with things flying around (monitor, mouse, abuses, calls, etc). Ok?We’re going to record all of the session to put up on your PakGamers Youtube Channel Lets see if this overflows, it most probably will but wel will make this scrollable hopefully.', 'Announcement for ramzan Tournament...']),
      ThreadClass('Workout Discussion', ['Traps Exercises?'], ['Hello']),
      ThreadClass('Supplements Discussion', ['Whey Protein Brands'], ['Hello']),
      ThreadClass('Miscellaneous', ['Getting fat'],
      ['Ramzan is making me fatter']),
    ];

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
                    child: ListView.builder(
                    itemCount: threads.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                        child: Card(
                          child: Container(
                            height: 150,
                            child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/post');
                            },
                            child: Column(
                              children: [
                                Text(
                                  threads[index].threadTitle,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: ssFont,
                                    color: Colors.orange[500],
                                    fontWeight: FontWeight.bold
                                  )
                                  ),

                                SizedBox(height: 20.0),

                                    Text(
                                      threads[index].postTitle[0],
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
                                  threads[index].postDescription[0],
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

                              ]
                            ),
                            ),

                          ),
                        ),
                      );
                    },
                  )
                  ),

                ]  
               
    );

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////      
      

  }
  
}
//Myapp


