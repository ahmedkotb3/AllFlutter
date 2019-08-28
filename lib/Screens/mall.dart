import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';




final list = ["dnk", "ankdn", "kdnn", "ahmed"];
String title = 'Malls';



class Malls extends StatefulWidget {
  _MallsState createState() => _MallsState();
}

class _MallsState extends State<Malls> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Malls',
        home: Scaffold(
          appBar: AppBar(
            //elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: new IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.amber,
                    ),
                    onPressed: () {}),
              ),
              new Stack(
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      Icons.shopping_basket,
                      color: Colors.amber,
                    ),
                    onPressed: null,
                  ),
                  list.length == 0
                      ? new Container()
                      : new Positioned(
                          child: new Stack(
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.redAccent),
                            new Positioned(
                                top: 4.0,
                                right: 6.0,
                                child: new Center(
                                  child: new Text(
                                    list.length.toString(),
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                ],
              ),
            ],
          ),
          body: Mall(),
        ));
  }
}

class Mall extends StatefulWidget {
  @override
  _MallState createState() => _MallState();
}

class _MallState extends State<Mall> {
  List<MallsList> mallDetails = [];
  Future<List<MallsList>> _mallDetials() async {
    var data = await http.get("https://api.myjson.com/bins/14tno7");
    var jsondata = json.decode(data.body);

    for (var bookvalue in jsondata) {
      MallsList malls =
          MallsList(bookvalue['mallName'], bookvalue['mallImage']);
      mallDetails.add(malls);
    }
    return mallDetails;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _mallDetials(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return OrientationBuilder(builder: (context, orentaion) {
              return GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orentaion == Orientation.portrait ? 2 : 3,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0),
                  itemBuilder: (BuildContext context, int index) {
                    return mycar(snapshot.data[index].mallName,
                        snapshot.data[index].mallImage, context);
                  });
            });
          } else {
            return Container(
                child: Text('loading'),
           );
          }
        });
  }
}

class MallsList {
  final String mallName;
  final String mallImage;

  MallsList(this.mallName, this.mallImage);
}


Widget mycar(String mallName, String mallImage, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      //side: BorderSide(width: 1,color: Colors.black),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
            highlightColor: Colors.blueAccent,
            child: AspectRatio(
              aspectRatio: 16.0 / 11.0,
              child: Image.network(
                mallImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            onTap: () {

            /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MallDetails())); */
            }),
        Padding(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Mall of Egypt'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.blue[200],
                    size: 16,
                  ),
                  Expanded(child: Text('Downtown,Alex'))
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}