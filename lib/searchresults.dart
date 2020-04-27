import 'package:flutter/material.dart';
import 'storescreenarg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DraggableScrollableSheet> getQueryResults(String queryPhrase) async{
  
  var query = (await Firestore.instance.collection('products').getDocuments()).documents;
  List<Map<String,dynamic>> products=List<Map<String,dynamic>>();
  List<String> docIds=List<String>();
  for(int x=0;x<query.length;x++){
    if ((query[x].data['prod_name'].toLowerCase().contains(queryPhrase.toLowerCase()) || query[x].data['prod_desc'].toLowerCase().contains(queryPhrase.toLowerCase())) && !(docIds.contains(query[x].documentID))){
      products.add(query[x].data);
      docIds.add(query[x].documentID);
    }
  }
  List<String> queryWords=queryPhrase.split(' ');
  for(int y=0;y<queryWords.length;y++){
    for(int x=0;x<query.length;x++){
      if ((query[x].data['prod_name'].toLowerCase().contains(queryWords[y].toLowerCase()) || query[x].data['prod_desc'].toLowerCase().contains(queryWords[y].toLowerCase())) && !(docIds.contains(query[x].documentID))){
        products.add(query[x].data);
        docIds.add(query[x].documentID);
      }
    }
  }
  int itcount=(products.length/2).round();
  //if (products.length % 2==0) itcount=(products.length/2) as int;
  //else itcount=(products.length/2+1) as int;
  return new Future( ()=> DraggableScrollableSheet(

          builder: (BuildContext context, ScrollController scrollController) {
           
              return  ListView.builder(
                  controller: scrollController,
                  itemCount: itcount,

                  itemBuilder: (BuildContext context, int index) {
                    int x=(index)*2;
                    int y=x+1;
                    if (y<products.length){
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

                  );}
                  else{
                    return Row(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.ltr, 
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
                            
                      ]

                   );
                  }
                  },
                
                
                );
          },
      

      )
  );
}
querylist(String query){
  return FutureBuilder<DraggableScrollableSheet> (
    future:getQueryResults(query),
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
                        child: Text(('Rs. ' + price.toString()), style: TextStyle(fontSize: 15,color: Colors.deepOrange[900]),),
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

Widget resultsscreen(BuildContext context, String query){
  return Scaffold(
    
    
    // backgroundColor: Colors.grey[getColor()[0]],

    // appBar: topbar(context, getColor()[0], getColor()[1]),
    
    // drawer: drawer_func(),

    body: Card(
            color: Colors.white,
            elevation: 10,
            margin: EdgeInsets.only(top:8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),

//////////////////////////////////////////////////////////////////////////////////////////
/////CHANGE ONLY THIS PART TO FIT ANY SCREEN INTO THE COMMON ITEMS TEMPLATE/////////////
          
            child: Column(
              children:  
                [
                  Padding(padding: EdgeInsets.all(22)),
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(child:querylist(query))
                ]  
              
              )

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////      
    ),

    //bottomNavigationBar: FootNavBar(), 

    );
}

