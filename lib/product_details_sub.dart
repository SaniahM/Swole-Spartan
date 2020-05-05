import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SwoleSpartan/review_list.dart';

// import 'dropdown_menu.dart';
// import 'product_details_main.dart';

import 'post_review.dart';
import 'properties.dart';
import 'review_list.dart';
import 'storescreenarg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'user.dart';

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

  Future<Widget> getrow(id) async{

  var productRef = Firestore.instance.collection('products').document(id);
  var variations = (await Firestore.instance.collection('products_variations').where('product', isEqualTo: productRef).getDocuments()).documents;
  
  var options =(await Firestore.instance.collection('variation_options').where('product', isEqualTo: productRef).getDocuments()).documents;
  
  
  List<List<String>> uniqueOptions=List<List<String>>();
  List<Row> rows=List<Row>();
  String ssFont = 'NeusaNextStf-CompactRegular.otf';


  for(int x=0;x<variations.length;x++){

    attributes.add(variations[x]['variation_desc']);
    choices.add('Choose an option');

    uniqueOptions.add(List<String>());
    for(int y=0;y<options.length;y++){
      if (!uniqueOptions[x].contains(options[y][variations[x]['variation_desc']])){
        uniqueOptions[x].add(options[y][variations[x]['variation_desc']]);
      }
    }

    rows.add(
                  // =====FLAVOUR Selection row=====//
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 22, 0, 0),
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

                    //=====Dropdown Menu for Flavour=====//

                    Expanded(
                      child: Container(
                        height: 23,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: EdgeInsets.fromLTRB(30, 32, 20, 10),
                        child: Center(child: DropdownButton<String>(
                              hint: Text(choices[x]),

                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                fontFamily: ssFont,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              
                              items: uniqueOptions[x].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(), 
                              onChanged: (String value) {
                                setState(() => choices[x] = value);
                              },
                            
                            
                            )
                            ),
                          ),
                        
                    ),
                  ]),
  
    );
  }

  return new Future( ()=> Container(
      child:Column(children: rows)
  )
  );
}


  final _reviewFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int deepOrangeShade = getColor()[1];
    ScreenArg arg = ModalRoute.of(context).settings.arguments;
    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    return SingleChildScrollView(
      child: Container(
        height: 1050,
        child: Column(
          children: <Widget>[
            //=====Product Name=====//
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

            //=====Product Picture=====//
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

            //=====Product Price=====//
            Text(
              'Rs. ${arg.price}',
              style: TextStyle(
                fontFamily: ssFont,
                fontSize: 20,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(child: getVariations(arg.id)),


            //=====QUANTITY Selection row=====//
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                  child: Text(
                    'QUANTITY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ssFont,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 30),
                  width: 80,
                  height: 20,


                  //Quantity Counter
                  child: Container(
                    child: TextFormField(
                      validator: (val){
                        if(int.parse(val) < 1){
                          return "Quantity cannot be below 0";
                        }
                        return null;

                      },
                      onChanged: (val){
                        quantity = int.parse(val);
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontFamily: ssFont, color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                //=====Add to Cart Button=====//
                IconButton(
                  onPressed: () async {
                    final user = Provider.of<User>(context, listen: false);
                    var prodRef = Firestore.instance.collection('poducts').document(arg.id);
                    var cartRef= await Firestore.instance.collection('shopping_cart').add({'product': prodRef, 'quantity':quantity,'user':user.uid});
                    Map<String,dynamic> cartVar={'cart_id': cartRef};
                    for (int x=0;x<attributes.length;x++){
                      cartVar[attributes[x]]=choices[x];
                    }
                    Firestore.instance.collection('cart_variations').add(cartVar);
                      //  passToCart(attributes, choices, quantity, arg)

                  },
                  padding: EdgeInsets.only(left: 30),
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.orange[deepOrangeShade],
                ),
              ],
            ),

            //=====DESCRIPTION EXPANSION TILE=====//
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
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: ssFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //=====REVIEW EXPANSION TILE=====//
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

                //=====Review List=====//
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 170,
                        child: reviewList(arg.id),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 15, bottom: 15),
                    height: 40,
                    //color: Colors.purple,
                    //width: 50,

                    //=====ADD REVIEW BUTTON=====//
                    child: FloatingActionButton(
                      tooltip: 'Write a Review',
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.add, size: 20),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),

                                //=====REVIEW FORM=====//
                                child: Form(
                                  key: _reviewFormKey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Write a Review',
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: ssFont,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),

                                      //=====Name field=====//
                                      Container(
                                        //padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        width: 325.0,
                                        height: 70,
                                        child: TextFormField(
                                          validator: (val) => val.isEmpty
                                              ? 'Name cannot be empty'
                                              : null,
                                          onChanged: (val) {
                                            setState(() => customerName = val);
                                          },
                                          cursorColor: Colors.amber,
                                          cursorWidth: 2.0,
                                          decoration: InputDecoration(
                                              labelText: "NAME",
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
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

                                      //=====Content Box=====//
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
                                              labelText: "REVIEW",
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
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
                                        height: 30,
                                      ),

                                      //=====POST REVIEW BUTTON=====//
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
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
