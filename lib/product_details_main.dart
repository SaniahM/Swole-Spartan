//This screen is the screen that is loaded whenever a product is clicked on
//and it displays all relevant product details along with selection options
//for specific details e.g flavour, weight
//The dropdown menus only shows flavour options for both right now

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//our own imports
// import 'package:flutter_counter/flutter_counter.dart';
import 'properties.dart';
import 'screens.dart';
import 'appbar.dart';
import 'footnavbar.dart';

class ViewProductPage extends StatefulWidget{
  @override
  _ViewProduct createState() => _ViewProduct();
}


Future<Widget> getrow(id) async{

  var variations = (await Firestore.instance.collection('products_variations').where('product', isEqualTo: '/products/'+id).getDocuments()).documents;
  var options =(await Firestore.instance.collection('variation_options').where('product', isEqualTo: '/products/'+id).getDocuments()).documents;
  List<List<String>> uniqueOptions=List<List<String>>();
  List<Row> rows=List<Row>();
  String ssFont = 'NeusaNextStf-CompactRegular.otf';
  for(int x=0;x<variations.length;x++){
    uniqueOptions.add(List<String>());
    for(int y=0;y<options.length;y++){
      if (!uniqueOptions[x].contains(options[y][variations[x]['variation_desc']])){
        uniqueOptions[x].add(options[y][variations[x]['variation_desc']]);
      }
    }
    rows.add(Row(
        children: <Widget>[
          Container(
            width: 120,
            height: 30,
            margin: EdgeInsets.only(top:20,left:20,bottom:5),
            child:Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
              child: Text(
                variations[x]['variation_desc'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: ssFont,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          //Dropdown Menu
          Expanded(
            child: Container(
              height: 23,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.only(left:30,top:19,right:20, bottom:5),
              child: Center(child: DropdownButton<String>(
                hint: Text('Choose an Option'),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  fontFamily: ssFont,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.orangeAccent,
                ),
                items: uniqueOptions[x].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                    .toList(), onChanged: (String value) {},
              )
              ),
            ),
          ),
        ]
    ),
    );
  }

  return new Future( ()=> Container(
      child:Column(children: rows)
  )
  );
}
getVariations(id){
  return FutureBuilder<Widget> (
      future: getrow(id),
      builder: (context,snapshot){
        if (snapshot.hasData){
          return snapshot.data;
        }
        else return CircularProgressIndicator();
      }
  );
}




class _ViewProduct extends State<ViewProductPage>{
  int _currentIndex = 5;
  int _sectionIndex = 0;
  //Counter variables

  @override
  Widget build(BuildContext context){
    //Set Colors from here

    return Scaffold(

      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.grey[getColor()[0]],

      appBar: topbar(context, getColor()[0], getColor()[1],_sectionIndex),

      body: Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.only(top:8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

//////////////////////////////////////////////////////////////////////////////////////////
/////CHANGE ONLY THIS PART TO FIT ANY SCREEN INTO THE COMMON ITEMS TEMPLATE/////////////
        // child: SingleChildScrollView(
        child: screens()[_currentIndex],

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
        // ),
      ),

      bottomNavigationBar: footBar(_sectionIndex, (index){
            setState(() {
              _currentIndex = index;
              _sectionIndex = index;
                          });
          }),

    );
  }



}