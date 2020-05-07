import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SwoleSpartan/review_list.dart';
// imp

import 'post_review.dart';
import 'properties.dart';
import 'review_list.dart';
import 'storescreenarg.dart';
import 'user.dart';
import 'auth.dart';
// import 'package:provider/provider.dart';
// import 'user.dart';
class ViewProductPageSub extends StatefulWidget {
  @override
  _ViewProductSub createState() => _ViewProductSub();
}

class _ViewProductSub extends State<ViewProductPageSub> {
  int counter = 0;
  int defaultValue = 0;
  String customerName;
  String review;
  int quantity = 0;

  List<String> attributes = [];
  List<String> choices = [];

  getVariations(id) {
    return FutureBuilder<Widget>(
        future: getRow(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else
            return CircularProgressIndicator();
        });
  }

  Future<Widget> getRow(id) async {
    var productRef = Firestore.instance.collection('products').document(id);
    var variations = (await Firestore.instance
            .collection('products_variations')
            .where('product', isEqualTo: productRef)
            .getDocuments())
        .documents;

    var options = (await Firestore.instance
            .collection('variation_options')
            .where('product', isEqualTo: productRef)
            .getDocuments())
        .documents;

    List<List<String>> uniqueOptions = List<List<String>>();
    List<Row> rows = List<Row>();
    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    for (int x = 0; x < variations.length; x++) {
      if (attributes.length < variations.length) {
        attributes.add(variations[x]['variation_desc']);
        choices.add('Choose an option');
      }

      uniqueOptions.add(List<String>());

      for (int y = 0; y < options.length; y++) {
        if (!uniqueOptions[x]
            .contains(options[y][variations[x]['variation_desc']])) {
          uniqueOptions[x].add(options[y][variations[x]['variation_desc']]);
        }
      }

      rows.add(
        //Flavour, size, weight row.
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  variations[x]['variation_desc'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: ssFont,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
              ),

              //Dropdown Menu.
              Expanded(
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 10, 30, 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: DropdownButton<String>(
                    hint: Text(choices[x]),
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      fontFamily: ssFont,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                    items: uniqueOptions[x]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        choices[x] = value;
                      });
                    },
                  )),
                ),
              ),
            ]),
      );
    }

    return new Future(() => Container(child: Column(children: rows)));
  }

  final _reviewFormKey = GlobalKey<FormState>();
  Icon cartIcon = Icon(Icons.add_shopping_cart);
  var _quantityFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          loginText = "Kindly log-in to review the product";
          floatColor = Colors.grey;
        }

    int deepOrangeShade = getColor()[1];
    ScreenArg arg = ModalRoute.of(context).settings.arguments;
    String ssFont = 'NeusaNextStf-CompactRegular.otf';
    dynamic pastReviews = reviewList(arg.id);

    return StreamBuilder<UserData>(
    
      stream: DatabaseService(uid: user.uid).userData,
    
     builder:(context,snapshot){ 
       
       UserData userdata = snapshot.data;
       if( user.status == false ){
        
        customerName = userdata.firstName + ' ' + userdata.lastName;
       
       }
        return SingleChildScrollView(
        child: Container(
        height: 1050,
        child: Column(
          children: <Widget>[
            //Product Name.
            Container(
              margin: EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Text(
                arg.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: ssFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),

            //Product Picture.
            Container(
                width: 200,
                height: 170,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(arg.imgLink),
                    fit: BoxFit.fill,
                  ),
                )),

            //Product Price.
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Rs. ${arg.price}',
                style: TextStyle(
                  fontFamily: ssFont,
                  fontSize: 20,
                  color: Colors.orange[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //Size, flavour, weight dropdown menus.
            Container(child: getVariations(arg.id)),

            //Quantity selection row.
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                  child: Text(
                    'Quantity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ssFont,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 30),
                  width: 80,
                  height: 20,

                  //Quantity field.
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                            cursorColor: Colors.amber,
                            cursorWidth: 2.0,
                      validator: (val) {
                        if (int.parse(val) < 1) {
                          return "Quantity cannot be below 0";
                        }
                        return null;
                      },
                      controller: _quantityFieldController,
                      onChanged: (val) {
                        quantity = int.parse(val);
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                        labelStyle:
                            TextStyle(fontFamily: ssFont, color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                //Add to Cart Button.
                IconButton(
                  onPressed: () async {
                     setState(() {
                     cartIcon = Icon(Icons.done); 
                    });

                    final user = Provider.of<User>(context, listen: false);
                    var prodRef = Firestore.instance
                        .collection('products')
                        .document(arg.id);
                    var cartRef = await Firestore.instance
                        .collection('shopping_cart')
                        .add({
                      'product': prodRef,
                      'quantity': quantity,
                      'user': user.uid
                    });

                    final snackBar = SnackBar(
                      
                      content: Text(
                        'Product added to cart'
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                    Map<String, dynamic> cartVar = {'cart_id': cartRef};
                    for (int x = 0; x < attributes.length; x++) {
                      cartVar[attributes[x]] = choices[x];
                    }
                    Firestore.instance
                        .collection('cart_variations')
                        .add(cartVar);
                    _quantityFieldController.clear();
                  },
                  padding: EdgeInsets.only(left: 30),
                  icon: cartIcon,
                  color: Colors.orange[deepOrangeShade],
                ),
              ],
            ),

            //Description expansion tile.
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 10, 0),
              child: ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: Colors.orange[deepOrangeShade]),
                title: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: ssFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                    child: Text(
                      arg.desc,
                      maxLines: 10,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: ssFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Review expansion tile.
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 10, 0),
              child: ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: Colors.orange[deepOrangeShade]),
                title: Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: ssFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Review list.
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 170,
                        child: pastReviews,
                      ),
                    ],
                  ),
                  
                    //color: Colors.purple,
                    //width: 50,

                    //Add review button.

                  Row(children:[
                    SizedBox(width: 20,),
                    SizedBox(child: Text(loginText),width: 250,),
                    FloatingActionButton(
                      tooltip: 'Write a Review',
                      backgroundColor: floatColor,
                      child: Icon(Icons.add, size: 24),
                      onPressed: () async {
                          if(user != null){
                          if(user.status == false){
                                                   
                        

                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0))),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(50, 20, 50, 80),
                                  //Review form.
                                  child: Form(
                                    key: _reviewFormKey,
                                    child: Wrap(
                                      children: <Widget>[
                                        Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            'WRITE A REVIEW',
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontFamily: ssFont,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),

                                        //Name text field.
                                        // Container(
                                        //   //padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        //   width: 325.0,
                                        //   height: 70,
                                        //   child: TextFormField(
                                        //     validator: (val) => val.isEmpty
                                        //         ? 'Name cannot be empty'
                                        //         : null,
                                        //     onChanged: (val) {
                                        //       setState(() => customerName = val);
                                        //     },
                                        //     cursorColor: Colors.amber,
                                        //     cursorWidth: 2.0,
                                        //     decoration: InputDecoration(
                                        //         labelText: "Name",
                                        //         labelStyle: TextStyle(
                                        //             fontSize: 16,
                                        //             fontFamily: ssFont,
                                        //             color: Colors.grey,
                                        //             height: 1.0),
                                        //         focusedBorder:
                                        //             UnderlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                     color:
                                        //                         Colors.orange))),
                                        //   ),
                                        // ),

                                        //Review text field.
                                        Container(
                                          width: 325.0,
                                          height: 70,
                                          child: TextFormField(
                                            validator: (val) => val.isEmpty
                                                ? 'This field cannot be empty'
                                                : null,
                                            onChanged: (val) {
                                              setState(() => review = val);
                                            },
                                            cursorColor: Colors.amber,
                                            cursorWidth: 2.0,
                                            decoration: InputDecoration(
                                                labelText: "Review",
                                                labelStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: ssFont,
                                                    color: Colors.grey,
                                                    height: 1.0),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.orange))),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        //Post review button.
                                        Container(
                                          //padding:EdgeInsets.fromLTRB(0, 25, 0, 0),
                                          //height: 40.0,
                                          width: 275.0,
                                          height: 35,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            shadowColor: Colors.orangeAccent,
                                            color: Colors.orange,
                                            elevation: 7.0,
                                            child: InkWell(
                                              hoverColor: Colors.red,
                                              splashColor: Colors.blueAccent,
                                              onTap: () async {
                                                if (_reviewFormKey.currentState
                                                    .validate()) {
                                                  await PostReview().newReview(
                                                      arg.id,
                                                      customerName,
                                                      review);
                                                  Navigator.pop(context);
                                                }
                                                setState(() {
                                                  pastReviews =
                                                      reviewList(arg.id);
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Center(
                                                    child: Text("POST",
                                                        style: TextStyle(
                                                          fontFamily: ssFont,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                      ],
                                    ),
                                  ),
                                ),

                              );
                            });

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
                    ),]
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );}  );
  }
  
  else{
    return Scaffold();
  }
  }
}
