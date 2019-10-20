/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';  
import 'b.dart';
import 'a.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 1,
      ),
      bottomNavigationBar: BottomNavBar(
        x: 0,
      ),
      body:Center(child: Text("hello"),),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  int x=0;
  BottomNavBar({this.x});
  @override
  State<StatefulWidget> createState() {
    return BottomNavBarState(selectedIndex:x);
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  BottomNavBarState({this.selectedIndex});
  Color backgroundColor = Colors.white;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text("Home"), Colors.deepPurpleAccent,(){print("aa");}),
    NavigationItem(Icon(Icons.favorite_border), Text("Faviorate"), Colors.pinkAccent,(){print("aa");}),
    NavigationItem(Icon(Icons.search), Text("Search"), Colors.amberAccent,(){print("aa");}),
    NavigationItem(Icon(Icons.person_outline), Text("profile"), Colors.cyan,(){print("aa");}),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: double.maxFinite,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            )
          : null,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconTheme(
              data: IconThemeData(
                size: 26,
                color: isSelected ? backgroundColor : Colors.black,
              ),
              child: item.icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(
                          color: backgroundColor, fontWeight: FontWeight.bold),
                      child: item.title)
                  : Container(),
            )
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                  onTap: () {
                      item.clickitem();
                      if(itemIndex==0){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                      }
                        else if(itemIndex==1){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>A(x: itemIndex,)));
                      }
                      else   if(itemIndex==2){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>B(x: itemIndex,)));
                      }
                      
                    setState(() {
                      selectedIndex = itemIndex;
                    });
                  },
                  child: _buildItem(item, selectedIndex == itemIndex));
            }).toList()));
  }
}

class NavigationItem {
  final Text title;
  final Icon icon;
  final Color color;
 final Function clickitem;
  NavigationItem(this.icon, this.title, this.color,this.clickitem);
}


*/