
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScreenArg{
  String name;
  String desc;
  String cat;
  String img_link;
  int price;
  String id;
  ScreenArg(this.name,this.desc,this.cat,this.img_link,this.price,this.id);
}
Future<DraggableScrollableSheet> getdata() async{
  
  var query = (await Firestore.instance.collection('products').limit(8).getDocuments()).documents;
  List<Map<String,dynamic>> products=List<Map<String,dynamic>>();
  for(int x=0;x<query.length;x++){
    products.add(query[x].data);
  }
  return new Future( ()=> DraggableScrollableSheet(

          builder: (BuildContext context, ScrollController scrollController) {
           
              return  ListView.builder(
                  controller: scrollController,
                  itemCount: 4,

                  itemBuilder: (BuildContext context, int index) {
                    int x=(index)*2;
                    int y=x+1;
                    
                    return Row(
                      
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children:[ 
                        singleItem(
                          context, 
                          products[x]['prod_name'], 
                          products[x]['image_link'], 
                          products[x]['price'], 
                          products[x]['category'], 
                          query[x].documentID,products[x]), 
                          // Padding(
                          //   padding: EdgeInsets.only(left: 70),
                          //   ) ,
                            singleItem(context,products[y]['prod_name'], 
                            products[y]['image_link'], 
                            products[y]['price'], 
                            products[y]['category'], 
                            query[y].documentID, 
                            products[y]) 
                      ]

                  );
                  },
                
                
                );
          },
      

      )
  );
}
featuredlist(){
  return FutureBuilder<DraggableScrollableSheet> (
    future:getdata(),
    builder: (context,snapshot){
      if (snapshot.hasData){
        return snapshot.data;
      }
      else return CircularProgressIndicator();
    }
  );
}

InkWell singleItem(context, name, images, price, categories, id, product){

  return InkWell(
    onTap: () {
          Navigator.of(context).pushNamed('/viewproduct', arguments: ScreenArg(name,product['prod_desc'],categories,images,price,id) );
      },

  child:Column(

                    children: [

                      Container(
                      // color: Colors.red,
                      height: 100,
                      width: 100,
                      
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                        
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: NetworkImage(images),
                            fit: BoxFit.fill


                      )
                    
                      ),

                      ),
                      
                      ),

                      Container(
                      width: 175,
                      child: Center(
                        child: Text(name, style: TextStyle(fontSize: 15, color: Colors.blue[900]),)
                      ),
                      ),

                      Container(
                      width: 175,
                      child: Center(
                        child: Text(categories, style: TextStyle(fontSize: 12,color: Colors.blue[900]),),
                      ),
                      ),

                      Container(
                      width: 175,
                      child: Center(
                        child: Text((price.toString()), style: TextStyle(fontSize: 15,color: Colors.deepOrange[900]),),
                      ),
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(width: 100, height: 40),
                        ]
                      )
                      // Padding(padding: EdgeInsets.only(bottom:10))
                      ],
                    
                    )
  );

}

