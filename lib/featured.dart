import 'package:flutter/material.dart';


DraggableScrollableSheet featuredlist(){
  
return DraggableScrollableSheet(

          builder: (BuildContext context, ScrollController scrollController) {
            return  ListView.builder(
                controller: scrollController,
                itemCount: 10,

                itemBuilder: (BuildContext context, int index) {

                  return Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children:[ singleItem(context), Padding(padding: EdgeInsets.only(left: 70),) ,singleItem(context) ]

                );
                },
              
              
              );
          },
      

      );

}

InkWell singleItem(context){

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
                            image: AssetImage('images/products/Cellucor.jpg'),
                            fit: BoxFit.fill


                      )
                    
                      ),

                      ),
                      
                      ),
                      Padding(padding: EdgeInsets.only(bottom:10)),

                      Text('Cellucor Cor-', style: TextStyle(fontSize: 15,color: Colors.blue[900]),),
                      Text('Performance isolate', style: TextStyle(fontSize: 12,color: Colors.blue[900]),),
                      Text('Rs 10,500', style: TextStyle(fontSize: 15,color: Colors.deepOrange[900]),),

                      Padding(padding: EdgeInsets.only(bottom:10))
                      ]
                    
                    )
  );

}

