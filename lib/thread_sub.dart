import 'package:flutter/material.dart';
import 'thread_list.dart';

import 'package:provider/provider.dart';
import 'user.dart';
import 'auth.dart';

class DFThreadPageSub extends StatefulWidget{
  @override
  _DFThreadPageSub createState() => _DFThreadPageSub();
}

class _DFThreadPageSub extends State<DFThreadPageSub>{


  @override
  Widget build(BuildContext context){
  final AuthService _auth = AuthService();
  final user = Provider.of<User>(context);
  if(user != null){
    String loginText;
    Color floatColor;
    

    if(user.status == false){
      loginText = " ";
      floatColor = Colors.orange[600];

    }
    else{
      loginText = "Log-in to contribute to the discussion";
      floatColor = Colors.grey;
    }


    String ssFont = 'NeusaNextStf-CompactRegular.otf';
    String category = ModalRoute.of(context).settings.arguments;
    

    
    
    return Column(
                children: <Widget> 
                [
                  SizedBox(height: 20),
                  
                  Center( 
                    child: Container(
                    child:Text(
                      category,
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: ssFont,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    ),
                  ),

                  SizedBox(height: 20.0),


                  Expanded(
                    child: threadsList(category)
                  
                  ),

                  SizedBox(height: 10,),
                  
                  
                  Row(
                    children: <Widget>[
                      
                      SizedBox(width: 50,),
                      SizedBox(width: 250,
                      child: Text(
                        
                        loginText,
                        style: TextStyle(fontFamily: ssFont,

                        fontWeight: FontWeight.bold,
                        
                        color: Colors.grey,
                        
                        ) 

                      ),
                      ),

                      FloatingActionButton(
                        
                        onPressed: () async {
                          if(user != null){
                          if(user.status == false){
                            Navigator.of(context).pushNamed('/new_thread', arguments: category);
                          }
                          else{
                            await _auth.signOut();
                            Navigator.of(context).pushNamed('/login');
                            
                          }
                        
                        }
                        else{
                            Navigator.of(context).pushNamed('/login');
                        }
                        },
                        child: Icon(Icons.add),
                        backgroundColor: floatColor, 
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0,),

                ]
              );

  }
  else{
    return Scaffold();
  }
  
  }


}