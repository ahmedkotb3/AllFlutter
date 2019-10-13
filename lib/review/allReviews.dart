import 'package:flutter/material.dart';
import 'package:big/componets/appBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:big/model/Review.dart';

class AllReviews extends StatefulWidget {
  int proId;
  AllReviews(this.proId);
  @override
  State<AllReviews> createState() {
    return AllReviewsState(proId);
  }
}

class AllReviewsState extends State<AllReviews> {
  int proid;
  AllReviewsState(this.proid);

  Future<List<Review>> getReviews() async {
    final res =
        await http.get("http://18.217.190.199/api/product/$proid/reviews");
    List<Review> list = <Review>[];

    if (res.statusCode == 200) {
      var data = json.decode(res.body);

      var restdata = data["data"][0];

      print("review data" + restdata.toString());

      list = restdata.map<Review>((json) => Review.fromJson(json)).toList();
      print("review dataaaaaaaaaaaaaaaaaaaaaaaaaaa" + list.toString());
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    getReviews();
  }

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
                      openAlertBox(context,proid);
                    },
                  )),
              Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * .7,
                child: FutureBuilder<List<Review>>(
                    future: getReviews(),
                    builder: (context, snapshot) {
                      List<Review> reviewList = snapshot.data;
                      return reviewList !=null?
                      ListView.builder(
                        itemCount: reviewList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          reviewList[index].customer.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '1h ago',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SmoothStarRating(
                                        allowHalfRating: false,
                                        starCount: 5,
                                        rating:
                                            reviewList[index].rate.toDouble(),
                                        size: 20.0,
                                        color: Colors.yellow,
                                        borderColor: Colors.grey,
                                        spacing: 0.0),
                                    Text(
                                      reviewList[index].content,
                                      style: TextStyle(fontSize: 14.0),
                                    )
                                  ]),
                            ),
                          );
                        },
                      ):Container(child:Center(
                          child: Column(children: <Widget>[
                  Text('Loading....'),
                  SizedBox(height: 20,),
                  CircularProgressIndicator()
              ],),
            ) );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> setReview(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userToken = await prefs.getString('userToken');
  print(userToken);
  final res =
      await http.post("http://18.217.190.199/api/product/$id/reviews",
      headers: {"Authorization": " bearer $userToken",
                  },
       body: {
    "rate": _rate.toString(),
    "content": contentController.text.toString()
  });

  if (res.statusCode == 200) {
    var data = json.decode(res.body);

    var restdata = data["data"];

    print("review data" + restdata.toString());
  }
}




double _rate = 0.0;
final contentController = TextEditingController();

openAlertBox(BuildContext context,int mid) {
  onchangerate(double r) {
    _rate = r;
    print(r.toString());
  }

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
                    child: SmoothStarRating(
                        allowHalfRating: false,
                        starCount: 5,
                        rating: _rate,
                        onRatingChanged: onchangerate,
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
                      controller: contentController,
                      decoration: InputDecoration(
                        hintText: "Write your review",
                        border: InputBorder.none,
                      ),
                      maxLines: 6,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setReview(mid);
                       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AllReviews(mid)));

                    },
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
