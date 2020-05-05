import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

String ssFont = 'NeusaNextStf-CompactRegular.otf';

DraggableScrollableSheet shoppingList() {
  return DraggableScrollableSheet(
    expand: true,
    builder: (BuildContext context, ScrollController scrollController) {
      return ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        padding: EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: 
            [ 
              Container(
                color: Colors.white,
                child: singleItem(context),
              ),
            Divider(),
          ]);
        },
      );
    },
  );
}

InkWell singleItem(context) {
  int _itemCount = 0;
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed('/viewproduct');
    },
    child: Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Row(
          children: <Widget>[
            //Prod Picture
            Image.asset(
              'images/products/Cellucor.jpg',
              height: 75,
            ),

            //Prod details
            Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 120,
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(10, 3, 0, 3),
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    'Cellucor COR-Performance Enchancing Powder with B+ Aminos',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: ssFont,
                      color: Colors.lightBlue[900],
                    ),
                  ),
                ),

                SizedBox(width: 40.0),

                _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed:(){}, color: Colors.lightBlue[900], ):new Container(),
                  new Text(_itemCount.toString()),
                  new IconButton(icon: new Icon(Icons.add),onPressed: (){}, color: Colors.lightBlue[900],)
                ],
            ),
          ],
        ),
      ),
    ),
  );
}
