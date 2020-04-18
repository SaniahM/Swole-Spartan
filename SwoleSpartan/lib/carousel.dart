import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget carousel(){

  return CarouselSlider(
            height: 180.0,
            autoPlay: true,

            
            items: ['A','B','C'].map((i) 
            {
              return Builder( 
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('images/banner/sale.jpeg'),
                        fit: BoxFit.fill

                      )
                    ),
                                      
                  );
                },
              );
            }).toList(),

          );
}