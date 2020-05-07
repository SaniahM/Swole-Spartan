import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget carousel(){

  return CarouselSlider(
            height: 180.0,
            autoPlay: true,

            // ['A','B','C'].map((i)
            // {
            //   return Builder( 
            //     builder: (BuildContext context) {
            //       return
            items: [
             Container(

                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage('https://swolespartan.com/wp-content/uploads/2020/02/stock-sale-website-banner-700x400.jpeg'),
                        fit: BoxFit.fill

                      )
                    ),
                                      
                  ),
                    Container(

                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage('https://swolespartan.com/wp-content/uploads/2019/07/fina-1.jpg'),
                        fit: BoxFit.fill

                      )
                    ),
                                      
                  ),
                Container(

                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage('https://swolespartan.com/wp-content/uploads/2019/07/fina-2.jpg'),
                        fit: BoxFit.fill

                      )
                    ),
                                      
                  ),
                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage('https://swolespartan.com/wp-content/uploads/2019/07/fina-3.jpg'),
                        fit: BoxFit.fill

                      )
                    ),
                                      
                  ),
            ]

          );
}