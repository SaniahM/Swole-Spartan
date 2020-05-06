
import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'user.dart';

String ssFont = 'NeusaNextStf-CompactRegular.otf';
Future<Container> getTotal(context) async{
  final user = Provider.of<User>(context, listen: false);
  var cart= (await Firestore.instance.collection('shopping_cart').where('user', isEqualTo: user.uid).getDocuments()).documents;
  List<int> quantity=List<int>();
  List<Map<String,dynamic>> products=List<Map<String,dynamic>>();
  int total=0;
  for (int x=0;x<cart.length;x++){
    var temp =(await cart[x].data['product'].get());
    products.add(temp.data);
    quantity.add(cart[x].data['quantity']);
    total=total+quantity[x]*products[x]['price'];
  }
  return Container(
          child: Text(
            'Rs. '+ total.toString(),
            style: TextStyle(
              fontFamily: ssFont,
              fontSize: 14,
              color: Colors.orange,
            ),
          ),

        );
}
shoppingTotal(context){
  return FutureBuilder<Container> (
    future:getTotal(context),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}
