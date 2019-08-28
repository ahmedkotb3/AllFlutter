import 'package:big/Providers/ColorsProvider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
SizedBox silder() {
  return SizedBox(
    width: double.infinity,
    child: Center(
      child: Carousel(
        boxFit: BoxFit.fill,
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        dotIncreasedColor: ColorProvider().danger,
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.bottomCenter,
        dotVerticalPadding: 10.0,
        showIndicator: true,
       // indicatorBgPadding: 7.0,
        images: [
          NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
          NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
          NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
        ],
      ),
    ),
  );
}