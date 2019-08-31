import 'package:big/Providers/ColorsProvider.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isBagFull=true;
  String dropdownValue = 'Delete all Items';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: ColorProvider().primary,
              onPressed: () {},
            ),
            new Text(
              "Your Bag",
              style: TextStyle(color: ColorProvider().primary),
            ),
            DropdownButton<String>(
              icon: Icon(Icons.more_vert),
//              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items:<String>['Delete all Items']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            )

          ],
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Total Amount ",style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),),
                  Text("1500000 EGP",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),),
                ],

              ),

               RaisedButton(
                  onPressed: (){},
                  child: Text("CHECKOUT",style: TextStyle
                    (color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0
                  ),
                  ),
                  color: ColorProvider().primary,
                ),


            ],
          ),

        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 218,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                            ),
                          ),
                        ),
                        Container(
                          height: 218,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: MyDetails(),
                          ),
                        ),
                        Container(
                          height: 218,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.close),
                                iconSize: 40.0,
                                onPressed: (){},
                              ),
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                iconSize: 40.0,
                                onPressed: (){},
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class MyDetails extends StatefulWidget {
  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Plus Button Back Guipure Lace Sleeve Belted Peplum Top",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      )),
                ],
              )),
        ),
        Container(
            child: Text(
              "1500 EGP",
              style: TextStyle(
                  color: ColorProvider().primary,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            )),
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.remove_circle),
                color: ColorProvider().primary,
                iconSize: 50.0,
              ),
              Text("1",style: TextStyle(
                fontSize: 30.0
              ),),
              IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.add_circle),
                color: ColorProvider().primary,
                iconSize: 50.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
