import 'package:flutter/material.dart';
import 'package:big/componets/appBar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class AllReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mybar("All Reviews", true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .08,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Add Review',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      openAlertBox(context);
                    },
                  )),
              Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * .7,
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, position) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Ahmed Torres',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '1h ago',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  starCount: 5,
                                  rating: position.toDouble(),
                                  size: 20.0,
                                  color: Colors.yellow,
                                  borderColor: Colors.grey,
                                  spacing: 0.0),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor…....',
                                style: TextStyle(fontSize: 14.0),
                              )
                            ]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

openAlertBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: SingleChildScrollView(
            child: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Review This Product",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child:
                      SmoothStarRating(
                          allowHalfRating: false,
                          starCount: 5,
                          rating: 3,
                          size: 20.0,
                          color: Colors.yellow,
                          borderColor: Colors.grey,
                          spacing: 0.0),
                    
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write your review",
                        border: InputBorder.none,
                      ),
                      maxLines: 
                      6,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: Text(
                        "Rate Product",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
