import 'package:flutter/material.dart';
import 'storehome.dart';
import 'video_section_home.dart';
import 'DF_home.dart';
import 'cart_sub.dart';
import 'checkout_sub.dart';
import 'product_details_sub.dart';
import 'storecategoryscreen_sub.dart';


List<Widget> screens(){

  return [

    StoreHomePage(), VSHomePage(), DFHomePage(),

    CartPageSub(), CheckoutPageSub(), ViewProductPageSub(),

    StoreCatPageSub(),



  ];


}
