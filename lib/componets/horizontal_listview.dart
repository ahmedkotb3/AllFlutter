import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/SubCategory.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:big/model/Category.dart';
import 'package:big/componets/products.dart';
import 'package:big/Screens/SubSubCategory.dart';

class HorizontalList extends StatelessWidget {
  final int catId;
  HorizontalList(this.catId);

  Future<List<Category>> fetchdata() async {
    final res = await http.get("http://18.217.190.199/api/categories/$catId");
    List<Category> list;

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["data"]["children"] as List;
      list = rest.map<Category>((json) => Category.fromJson(json)).toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          height: MediaQuery.of(context).size.height * 0.18,
          child: FutureBuilder<List<Category>>(
              future: fetchdata(),
              builder: (context, snapshot) {
                List<Category> mylist = snapshot.data;
                return mylist!=null?
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mylist.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            print(mylist[index].id.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SubSubCategory(
                                          catID: mylist[index].id,
                                          subtitle: mylist[index].name,
                                        )));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Material(
                                color: Colors.white,
                                elevation: 4.0,
                                borderRadius: BorderRadius.circular(10.0),
                                shadowColor: Color(0x802196F3),
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            mylist[index].name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: DataProvider().primary,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: ClipRRect(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                            child: Image.network(
                                              mylist[index].imageCover,
                                              fit: BoxFit.contain,
                                              alignment: Alignment.topRight,
                                            ),
                                          ),
                                        )),
                                  ],
                                )),
                          ),
                        ));
                  }),
                ):Container(child:Center(
                          child: Column(children: <Widget>[
                  Text('Loading....'),
                  SizedBox(height: 20,),
                  CircularProgressIndicator()
              ],),
            ) );
              })),
    );
  }
}
