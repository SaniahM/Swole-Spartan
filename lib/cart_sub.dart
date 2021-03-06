import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shopping_list.dart';
import 'user.dart';

//Shopping cart page elements.
class CartPageSub extends StatefulWidget {
  @override
  _CartPageSub createState() => _CartPageSub();
}

class _CartPageSub extends State<CartPageSub> {
  //Each product in the list of cart content.
  InkWell singleItem(context, productData, quantity, cartData) {
    int _itemCount = quantity;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/viewproduct');
      },
      child: Container(
        height: 84,
        //color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Product Picture.
            Image.network(
              productData['image_link'],
              height: 75,
              width: 75,
            ),

            //Product details.
            Row(
              children: <Widget>[
                Container(
                  width: 120,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    productData['prod_name'],
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: ssFont,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
                //SizedBox(width: 40.0),

                //Remove icon to decrease the quantity of a product in cart.
                _itemCount != 0
                    ? new IconButton(
                        icon: new Icon(Icons.remove,
                            size: 13, color: Colors.black),
                        onPressed: () async {
                          var varOpt = (await Firestore.instance
                              .collection('shopping_cart')
                              .document(cartData.documentID)
                              .get());
                          quantity = quantity - 1;
                          if (quantity > 0) {
                            varOpt.reference.updateData({'quantity': quantity});
                            setState(() => {});
                          } else {
                            var variationDoc = (await Firestore.instance
                                    .collection('cart_variations')
                                    .where('cart_id',
                                        isEqualTo: cartData.reference)
                                    .getDocuments())
                                .documents;
                            variationDoc[0].reference.delete();
                            varOpt.reference.delete();
                            cartData.reference.delete();
                            setState(() => {});
                          }
                        },
                        color: Colors.grey[700],
                      )
                    : new Container(),

                //Quantity of product.
                new Text(
                  _itemCount.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                //Add icon to increase the quantity of a product in cart.
                new IconButton(
                  icon: new Icon(
                    Icons.add,
                    size: 13,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    var varOpt = (await Firestore.instance
                        .collection('shopping_cart')
                        .document(cartData.documentID)
                        .get());
                    quantity = quantity + 1;
                    _itemCount = quantity;

                    varOpt.reference.updateData({'quantity': quantity});
                    setState(() => {});
                  },
                  color: Colors.grey[700],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //List of cart content.
  Future<ListView> getCartData(context) async {
    final user = Provider.of<User>(context, listen: false);
    var cart = (await Firestore.instance
            .collection('shopping_cart')
            .where('user', isEqualTo: user.uid)
            .getDocuments())
        .documents;
    List<int> quantity = List<int>();
    List<Map<String, dynamic>> products = List<Map<String, dynamic>>();
    for (int x = 0; x < cart.length; x++) {
      products.add((await cart[x].data['product'].get()).data);
      quantity.add(cart[x].data['quantity']);
    }
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context, int index) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            color: Colors.white,
            child: singleItem(
                context, products[index], quantity[index], cart[index]),
          ),
          Divider(),
        ]);
      },
    );
  }

  shoppingList(context) {
    return FutureBuilder<ListView>(
        future: getCartData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else
            return CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    //Cart screen components.
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        /*decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),*/
        child: Wrap(
          children: <Widget>[
            //SHOPPING CART TITLE
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.fromLTRB(0, 3.0, 0.0, 0.0),
                //width: 10,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Text(
                  'SHOPPING CART',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: ssFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            //Scrollable Product list.
            Container(
              margin: EdgeInsets.fromLTRB(40, 35, 40, 0),
              height: 320.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: shoppingList(context),
                  ),
                ],
              ),
            ),

            //Total Bill Window.
            Container(
              //height: 90,
              margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
              padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[200],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Subtotal row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal: ',
                        style: TextStyle(
                          fontFamily: ssFont,
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      ),
                      //Container for calculated prices

                      shoppingTotal(context)
                    ],
                  ),

                  //Divider
                  Divider(),

                  //Shipping row.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Shipping: ',
                        style: TextStyle(
                          fontFamily: ssFont,
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      ),
                      Container(
                        child: Text(
                          'Rs. 0',
                          style: TextStyle(
                            fontFamily: ssFont,
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(),

                  //Total row.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total: ',
                        style: TextStyle(
                          fontFamily: ssFont,
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      ),
                      shoppingTotal(context)
                    ],
                  ),
                ],
              ),
            ),

            //Checkout button.
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/checkout');
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 15, 40, 0),
                padding: EdgeInsets.fromLTRB(60, 0.0, 0.0, 2.5),
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.orange,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset.zero,
                      color: Colors.grey[400],
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'PROCEED TO CHECKOUT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right,
                        color: Colors.white, size: 25),
                  ],
                ),
              ),
            ),

            //Continue Shopping Button.
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                padding: EdgeInsets.fromLTRB(65, 0.0, 0.0, 2.5),
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset.zero,
                      color: Colors.grey[300],
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'CONTINUE SHOPPING',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right,
                        color: Colors.orange, size: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
