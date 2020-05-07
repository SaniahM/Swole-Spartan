
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shopping_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';

// import 'shopping_list.dart';
// import 'auth.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
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
            'Rs. '+total.toString(),
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

class CheckoutPageSub extends StatefulWidget {
  @override
  _CheckoutPageStateSub createState() => _CheckoutPageStateSub();
}


class _CheckoutPageStateSub extends State<CheckoutPageSub> {

InkWell singleItem(context, productData, quantity, cartData){
    int _itemCount = quantity;
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
              Image.network(
                productData['image_link'],
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
                      productData['prod_name'],
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: ssFont,
                        color: Colors.lightBlue[900],
                      ),
                    ),
                  ),

                  SizedBox(width: 40.0),

                  _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),
                  onPressed:() async{
                    var varOpt = (await Firestore.instance.collection('shopping_cart').document(cartData.documentID).get());
                    quantity=quantity-1;
                    if (quantity>0){
                      varOpt.reference.updateData({'quantity':quantity});
                    setState(() =>{
                      });
                    }
                    else{
                      var variationDoc= (await Firestore.instance.collection('cart_variations').where('cart_id', isEqualTo: cartData.reference).getDocuments()).documents;
                      variationDoc[0].reference.delete();
                      varOpt.reference.delete();
                      cartData.reference.delete();
                      setState(() =>{
                      });
                    }
                  }, 
                  
                  color: Colors.lightBlue[900], ):new Container(),

                    new Text(_itemCount.toString()),
                    
                    new IconButton(icon: new Icon(Icons.add),onPressed: () async{
                    var varOpt = (await Firestore.instance.collection('shopping_cart').document(cartData.documentID).get());
                      quantity=quantity+1;
                      _itemCount=quantity;
                      
                      varOpt.reference.updateData({'quantity':quantity});
                      setState(() =>{
                      });
                    }, 
                    color: Colors.lightBlue[900],
                    )
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
Future<DraggableScrollableSheet> getCartData(context) async{
  final user = Provider.of<User>(context, listen: false);
  var cart= (await Firestore.instance.collection('shopping_cart').where('user', isEqualTo: user.uid).getDocuments()).documents;
  List<int> quantity=List<int>();
  List<Map<String,dynamic>> products=List<Map<String,dynamic>>();
  for (int x=0;x<cart.length;x++){
    products.add((await cart[x].data['product'].get()).data);
    quantity.add(cart[x].data['quantity']);
  }
  return DraggableScrollableSheet(
    expand: true,
    builder: (BuildContext context, ScrollController scrollController) {
      return ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        padding: EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: 
            [ 
              Container(
                color: Colors.white,
                child: singleItem(context, products[index], quantity[index], cart[index]),
              ),
            Divider(),
          ]);
        },
      );
    },
  );
}

shoppingList(context){
  return FutureBuilder<DraggableScrollableSheet> (
    future:getCartData(context),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}


@override
Widget build(BuildContext context) {


final user = Provider.of<User>(context);
return 

StreamBuilder<UserData>(
    stream: DatabaseService(uid: user.uid).userData,
  
     builder:(context,snapshot){ 
       
       UserData userdata = snapshot.data;
        String address= ' ';
        String name= ' ';
        String phone=' ';
        String email=' ';

        if(user.status == false){        
          address=userdata.address;
          name=userdata.firstName+' '+userdata.lastName;
          phone=userdata.phone;
          email=userdata.email;
        }

        return Container(
        child:
        Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                      'ORDER DETAILS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 80),

                //DELIVERY DETAILS
                Container(
                  height: 250,
                  // color:Colors.pink,
                  margin: EdgeInsets.fromLTRB(40, 0, 60, 0),
                  child: Wrap(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person_outline, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                            /*Text('Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(width: 50.0,),*/
                             
                            // Padding(padding: EdgeInsets.only(left: 20),),

                            //SWITCH
                          //  if (_isEditingText)

                           Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: name,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ), 
                             
                            //  Text(userdata.firstName+ " " +userdata.lastName,
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       fontFamily: ssFont,
                            //       color: Colors.grey,
                            //     ),
                            //   ),
                          //  )

                            ],
                          ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),


                      //PHONE ROW
                      Row(
                        children: <Widget>[
                          Icon(Icons.phone, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                              /*Text('Phone',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(width: 48.0),*/
                            
                             
                            // Padding(padding: EdgeInsets.only(left: 20),),

                            Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: phone,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ),
                           
                          //  Text(userdata.phone, //SWITCH
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontFamily: ssFont,
                          //       color: Colors.grey,
                          //     ),
                          //   )

                            ],
                          ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      //EMAIL ROW
                      Row(
                        children: <Widget>[
                          Icon(Icons.email, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                              /*Text('Email',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(width: 55.0),*/

                             
                            // Padding(padding: EdgeInsets.only(left: 20),),

                           Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: email,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ),

                          //  Text(userdata.email, //SWITCH
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontFamily: ssFont,
                          //       color: Colors.grey,
                          //     ),
                          //   )

                            ],
                          ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30.0,
                      ),


                      //ADDRESS
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on, size: 22,color: Colors.grey,),

                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(20, 3, 0, 3),
                            padding: EdgeInsets.only(top: 3),
                            child: Row( 
                              children:[

                              /*Text('Address',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: ssFont,
                                color: Colors.grey,
                              ),
                            ),
                             
                            SizedBox(width: 35.0),*/

                            // Padding(padding: EdgeInsets.only(left: 20),),

                           Container(
                             width: 100,
                             child: TextFormField(
                               cursorColor: Colors.amber,
                                    cursorWidth: 2.0,
                                    decoration: InputDecoration(
                                      hintText: address,
                                      labelStyle: TextStyle(
                                        fontFamily: ssFont,
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      // focusedBorder: UnderlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.orange)
                                    // ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                             ),
                             ),

                          //  Text(userdata.address, //SWITCH
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontFamily: ssFont,
                          //       color: Colors.grey,
                          //     ),
                          //   )

                            ],
                          ),                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                
             
             

                //YOUR ORDER TITLE
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    //width: 10,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Text(
                      'YOUR ORDER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ssFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),

//                 //ORDER DETAILS
                Container(
                  // height: 200,
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                          ),

                          //Container for calculated prices
                          
                          shoppingTotal(context)

                        ],
                      ),

                      //Divider
                      Divider(),

                      //Shipping row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Shipping: ',
                            style: TextStyle(
                              fontFamily: ssFont,
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                          ),

                          Container(
                            child: Text(
                              'Rs. 0',
                              style: TextStyle(
                                fontFamily: ssFont,
                                fontSize: 14,
                                color: Colors.orange,
                              ),
                            ),
                          ),

                        ],
                      ),

                      Divider(),

                      //Total row

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total: ',
                            style: TextStyle(
                              fontFamily: ssFont,
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                          ),

                          shoppingTotal(context)

                        ],
                      ),
                    ],
                  ),
                ),

                //PLACE ORDER BUTTON
                InkWell(
                  onTap: () async{

                    Map<String,dynamic> newVal={'name':name,'phone':phone,'address':address,'email':email,'uid':user.uid};
                    var cart= (await Firestore.instance.collection('shopping_cart').where('user', isEqualTo: user.uid).getDocuments()).documents;
                    int quantity;
                    List<DocumentReference> varId=List<DocumentReference>();
                    for (int x=0;x<cart.length;x++){
                      DocumentSnapshot products=(await cart[x].data['product'].get());
                      var variations=(await Firestore.instance.collection('products_variations').where('product',isEqualTo: cart[x].data['product']).getDocuments()).documents;
                      var options=(await Firestore.instance.collection('cart_variations').where('cart_id',isEqualTo: cart[x].reference).getDocuments()).documents;
                      quantity=cart[x].data['quantity'];
                      var varOp=(await Firestore.instance.collection('variation_options').where('product',isEqualTo: cart[x].data['product']).getDocuments()).documents;
                      varId.add(options[0].reference);
                      for (int y=0;y<variations.length;y++){
                        newVal[variations[y].data['variation_desc']+x.toString()]=options[0].data[variations[y].data['variation_desc']];
                      }
                      for (int y=0;y<varOp.length;y++){
                        bool found=true;
                        for (int z=0;z<variations.length;z++){
                          if (varOp[y].data[variations[z].data['variation_desc']]!=options[0].data[variations[z].data['variation_desc']]){
                            found=false;
                            break;
                          }
                        }
                        if (found==true){
                          if (varOp[y].data['quantity']<quantity){
                            //RAISE ERROR HERE
                      final snack = SnackBar(
                      
                      content: Text(
                        'Requested Quantity exceeds availability in store'
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snack);
                            
                            return;
                          }
                          break;
                        }
                      }
                      newVal['productName'+x.toString()]=products.data['prod_name'];
                      newVal['product'+x.toString()]=products.reference;
                      newVal['quantity'+x.toString()]=quantity;
                    }
                      final snackBar = SnackBar(
                      
                      content: Text(
                        'Order Placed!'
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                    for (int x=0;x<varId.length;x++){
                      Firestore.instance.collection('cart_variations').document(varId[x].documentID).delete();
                    }
                    for (int x=0;x<cart.length;x++){
                      Firestore.instance.collection('shopping_cart').document(cart[x].documentID).delete();
                    }
                    await Firestore.instance.collection('orders').add(newVal);
                    
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  
                  
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 15, 40, 0),
                    padding: EdgeInsets.fromLTRB(0, 0.0, 0.0, 2.5),
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.orange,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset.zero,
                          color: Colors.grey[400],
                          blurRadius: 11,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'PLACE ORDER',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: ssFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),






              ],
            
        )));
        
      
    }
  );
  }
}
