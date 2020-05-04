import 'package:flutter/material.dart';
import 'storehome.dart';
import 'video_section_home.dart';
import 'DF_home.dart';
import 'cart_sub.dart';
import 'checkout_sub.dart';
import 'product_details_sub.dart';
import 'storecategoryscreen_sub.dart';
import 'thread_sub.dart';
import 'post_sub.dart';
import 'new_thread_sub.dart';

List<Widget> screens(){

  return [

    StoreHomePage(), VSHomePage(), DFHomePage(), //0-2

    CartPageSub(), CheckoutPageSub(), ViewProductPageSub(), StoreCatPageSub(),//3-6

    VSHomePage(),  //7
    
    DFThreadPageSub(), DFPostPageSub(), DFNewThreadPageSub()//8-10

  ];


}
