import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'properties.dart';
import 'store_screen_arg.dart';

//Category wise product lists for the side menu.
Future<ListView> getCategoryData(String category) async {
  var query = (await Firestore.instance
          .collection('products')
          .where('category', isEqualTo: category)
          .getDocuments())
      .documents;
  List<Map<String, dynamic>> products = List<Map<String, dynamic>>();
  for (int x = 0; x < query.length; x++) {
    products.add(query[x].data);
  }
  int itCount = (products.length / 2).round();
  return new Future(() => ListView.builder(
        itemCount: itCount,
        itemBuilder: (BuildContext context, int index) {
          int x = (index) * 2;
          int y = x + 1;
          if (y < products.length) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  singleItem(
                      context,
                      products[x]['prod_name'],
                      products[x]['image_link'],
                      products[x]['price'],
                      products[x]['category'],
                      query[x].documentID,
                      products[x]),
                  singleItem(
                      context,
                      products[y]['prod_name'],
                      products[y]['image_link'],
                      products[y]['price'],
                      products[y]['category'],
                      query[y].documentID,
                      products[y])
                ]);
          } else {
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  singleItem(
                      context,
                      products[x]['prod_name'],
                      products[x]['image_link'],
                      products[x]['price'],
                      products[x]['category'],
                      query[x].documentID,
                      products[x]),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 70),
                  //   ) ,
                ]);
          }
        },
      ));
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

categorylist(String category) {
  return FutureBuilder<ListView>(
      future: getCategoryData(category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else
          return progressIndicator();
      });
}

InkWell singleItem(context, name, images, price, categories, id, product) {
  return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/viewproduct',
            arguments: ScreenArg(
                name, product['prod_desc'], categories, images, price, id));
      },
      child: Column(
        children: [
          Container(
            height: 120,
            width: 150,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                      image: NetworkImage(images), fit: BoxFit.fitWidth)),
            ),
          ),
          Container(
            width: 125,
            child: Center(
              child: Text(
                categories,
                style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.5),
          ),
          Container(
            width: 125,
            child: Center(
                child: Text(
              name,
              style: TextStyle(fontSize: 12, color: Colors.blue[900]),
              textAlign: TextAlign.center,
            )),
          ),
          Container(
            width: 125,
            child: Center(
              child: Text(
                ('Rs. $price'),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepOrange[getColor()[0] + 400]),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(children: <Widget>[
            SizedBox(width: 100, height: 40),
          ])
        ],
      ));
}
