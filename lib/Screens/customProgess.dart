import 'package:big/Screens/HomeScreen.dart';
import 'package:big/Screens/cart.dart';
import 'package:big/Screens/checkout.dart';
import 'package:big/Screens/login.dart';
import 'package:big/Screens/progress.dart';
import 'package:big/Screens/register.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
   final int currentpage ;
   CustomProgressBar(this.currentpage);
   @override
   _CustomProgressBarState createState() => _CustomProgressBarState();
 }
 
 class _CustomProgressBarState extends State<CustomProgressBar> { 

   
  final _stepsText = ["CART", "SHIPPING", "CHECKOUT","COMPLITED"];

  final _stepCircleRadius = 10.0;

  final _stepProgressViewHeight = 70.0;

  Color _activeColor = Color(0xff193ca1);

  Color _inactiveColor = Color(0xffe3eaff);

  TextStyle _headerStyle =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  TextStyle _stepStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);


  int _curPage = 1;

  ProgressBar _getStepProgress() {
    setState(() {
     _curPage = widget.currentpage; 
    });
    return ProgressBar(
      _stepsText,
      _curPage,
      _stepProgressViewHeight,
      double.infinity,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _headerStyle,
      _stepStyle,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(
        top: 14.0,
        left: 14.0,
        right: 14.0,
      ),
    );
  }
   @override
   Widget build(BuildContext context) {
    return 
        Container(height: 70.0, child: _getStepProgress());
        // Expanded(
        //   child: PageView(
        //   onPageChanged: (i) {
        //     setState(() {
        //       _curPage = i + 1;
        //     });
        //   },
        //   children: <Widget>[
        //     CartPage(),
        //     HomeScreen(),
        //     Checkout(),
        //     RegisterPage(),
        //   ],
        // ),
        // )
      
  }
}