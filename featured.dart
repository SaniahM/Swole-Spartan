import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:woosignal/models/response/products.dart';
import 'package:woosignal/woosignal.dart';

Future<DraggableScrollableSheet> _woosignalcall() async{
  
  var wsConfig = {"appKey": "ck_fe71ea158497f71a90e9bf465fd6305456bbb4a9", "debugMode": true};
  // CREATING AN INSTANCE
  WooSignal wooSignal = await WooSignal.getInstance(config: wsConfig);

  List<Product> products = await wooSignal.getProducts();
  return new Future( ()=> DraggableScrollableSheet(

          builder: (BuildContext context, ScrollController scrollController) {
           
              int multiplier=0;
              return  ListView.builder(
                  controller: scrollController,
                  itemCount: 4,

                  itemBuilder: (BuildContext context, int index) {
                    int x=index+2*multiplier;
                    int y=index+2*multiplier+1;
                    multiplier++;
                    Uint8List img1=base64.decode(products[x].images[0].src);
                    Uint8List img2=base64.decode(products[y].images[0].src);
                    return Row(
                      
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children:[ singleItem(context, products[x].name, img1, products[x].price, products[x].categories, products[x].id), Padding(padding: EdgeInsets.only(left: 70),) ,singleItem(context,products[y].name, img2, products[y].price, products[y].categories, products[y].id) ]

                  );
                  },
                
                
                );
          },
      

      )
  );
}
featuredlist(){
  return FutureBuilder<DraggableScrollableSheet> (
    future:_woosignalcall(),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}

InkWell singleItem(context, name, images, price, categories, id){

  return InkWell(
    onTap: () {
          Navigator.of(context).pushNamed('/viewproduct');
      },

  child:Column(

                    children: [Container(
                      color: Colors.white,
                      height: 100,
                      width: 100,
                      
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                        
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(images[0]),
                            fit: BoxFit.fill


                      )
                    
                      ),

                      ),
                      
                      ),
                      Padding(padding: EdgeInsets.only(bottom:10)),

                      Text(name, style: TextStyle(fontSize: 15,color: Colors.blue[900]),),
                      Text(categories[0].name, style: TextStyle(fontSize: 12,color: Colors.blue[900]),),
                      Text(price, style: TextStyle(fontSize: 15,color: Colors.deepOrange[900]),),

                      Padding(padding: EdgeInsets.only(bottom:10))
                      ]
                    
                    )
  );

}

