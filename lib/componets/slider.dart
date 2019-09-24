import 'package:big/Providers/ColorsProvider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

SizedBox silder(BuildContext context) {
  
  return SizedBox(
    width:double.infinity,
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
          NetworkImage('https://www.elcorteingles.com/sgfm/SGFM/contentsi18/images/uploads/2019/09/5d6fcb33ab966a6c0e315560.jpg'),
          NetworkImage('https://cdn-img.instyle.com/sites/default/files/styles/684xflex/public/1508267314/101717-50-best-fashion-advice-21.jpg?itok=Rqz7EhsZ'),
          NetworkImage('https://cdn.pixabay.com/photo/2017/12/29/14/07/model-3047709_960_720.jpg'),
        ],
      ),
    ),
  );
}