import 'package:flutter/material.dart';

String ssFont = 'NeusaNextStf-CompactRegular.otf';

ListView dfCategoryList(){
  List<String> uniqueCats=List<String>();
  uniqueCats.add('General Discussion');
  uniqueCats.add('Workout Discussion');
  uniqueCats.add('Supplements Discussion');
  return ListView.builder(
    itemCount: uniqueCats.length,
    itemBuilder: (BuildContext context, int index) {
      if (index==0)
        return Column(
          children:<Widget>[ 
            SizedBox(height: 100),

            Row(
            children: <Widget>[
             SizedBox(width: 30),
             InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/thread', arguments: uniqueCats[index]);
                      },
                      child: Text(
                        uniqueCats[index],
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.grey[600],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold


                          )
                      ),
                    ),
            // SizedBox(width: 0), 
            // Icon(
            //   Icons.arrow_right,
            //   size: 30,
            //   color: Colors.grey,
            // ),

            ]
            ),

            SizedBox(height: 20)
          ]);
          else return Column(
          children:<Widget>[ 
            Row(
            children: <Widget>[
             SizedBox(width: 30),
             InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/thread', arguments: uniqueCats[index]);
                      },
                      child: Text(
                        uniqueCats[index],
                        style: TextStyle(
                          fontFamily: ssFont,
                          color: Colors.grey[600],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)
                      ),
                    ),
            // SizedBox(width: 50), 
            // Icon(
            //   Icons.arrow_right,
            //   size: 30,
            //   color: Colors.grey,
            // ),

            ]
            ),

            SizedBox(height: 20)
          ]);
          
      }             
    );
}

ClipRRect dfDrawerFunc() {

  return ClipRRect(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(700), topRight: Radius.circular(0), ),
    child: Drawer(
    child: Container(
      color: Colors.white,
        child: dfCategoryList()
    ),
    ),
  );

}