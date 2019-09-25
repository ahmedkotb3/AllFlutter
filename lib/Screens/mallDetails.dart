import 'package:flutter/material.dart';

class MallDetails extends StatefulWidget {
  MallDetailsState createState() => MallDetailsState();
}


class MallDetailsState extends State<MallDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () {},
              ),
              elevation: 0,
              titleSpacing: 50,
              title: new Text("My Title"),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.cyan),
                          ),
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.all(3.0),
                          child: ClipOval(
                            child: Image.network(
                                "https://www.citycentremallbeirut.com/-/media/logos-all-malls/24-06/og/cc-beirut-eng.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text("Cairo Festival City Mallr",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on),
                                Text('Alex,Egypt'),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.phone),
                                Text('01270089899'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                        child: RaisedButton(
                            child: Text(
                              'SEE ALL MALL SHOPS',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MallShops()));
                            })),
                    Divider(
                      height: 10,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Working Time'),
                        Text('From Sat  To Wed'),
                        Text('From 10:00AM To 11:30PM'),
                        Text('From Sat  To Wed'),
                        Text('From 10:00AM To 11:30PM'),
                      ],
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey,
                    ),
                    Text('Mall Map'),
                    Image.network(
                        'https://www.antoninecumbernauld.com/uploads/1/0/9/0/109044539/web-mall-map_orig.png'),
                  ],
                ),
              ),
            )));
  }
}
