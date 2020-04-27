import 'package:flutter/material.dart';
import 'categoryproductlist.dart';

class StoreCatPageSub extends StatefulWidget{
  @override
  _StoreCategorySub createState() => _StoreCategorySub();
}

class _StoreCategorySub extends State<StoreCatPageSub>{
 @override
  Widget build(BuildContext context){
    String arg = ModalRoute.of(context).settings.arguments;
    return Center( child:Column(
                children:  
                  [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Expanded(child:categorylist(arg))
                  ]  
               
                ));
}
}