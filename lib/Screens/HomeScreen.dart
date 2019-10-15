import 'package:big/Providers/AuthProvider.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/Providers/Translation.dart';
import 'package:big/Screens/ContactUs.dart';
import 'package:big/Screens/FAQ.dart';
import 'package:big/Screens/SubCategory.dart';
import 'package:big/Screens/Terms.dart';
import 'package:big/Screens/editAccount.dart';
import 'package:big/Screens/login.dart';
import 'package:big/Screens/register.dart';
import 'package:big/Screens/whishlist.dart';
import 'package:big/componets/Connection.dart';
import 'package:big/componets/appBar.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:big/Screens/mall.dart';
import 'package:big/Providers/Styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:big/model/Category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../localization/application.dart';
import '../localization/app_translation.dart';
import 'package:big/model/Category.dart';
import 'package:connectivity/connectivity.dart';
import 'package:big/model/Productsmodel.dart';
import 'package:big/Screens/details.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'English';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLogin = true;
  String userName = "mohamed";
  String userEmail = "m@m.com";
  String userImage =
      "https://onlinecoursemasters.com/wp-content/uploads/2019/05/OCM-16-Maximilian-Schwarzmuller.jpg";
  bool connected = false;
  @override
  void initState() {
    check();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (BuildContext context) => Translation(),
        child: connected == false
            ? FlareConnection()
            : MaterialApp(
                title:
                    AppLocalizations.of(context).translateString('title_home'),
                home: Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          icon: new Icon(Icons.menu, color: Colors.white),
                          onPressed: () =>
                              _scaffoldKey.currentState.openDrawer()),
                      backgroundColor: DataProvider().primary,
                      elevation: 0,
                      titleSpacing: 50,
                      title: new Text(
                        AppLocalizations.of(context)
                            .translateString('title_home'),
                      ),
                      actions: <Widget>[
                        SearchCart(DataProvider().cartItems, false, false)
                      ],
                    ),
                    key: _scaffoldKey,
                    drawer: Drawer(
                      child: ListView(
                        children: <Widget>[
                          if (isLogin)
                            UserAccountsDrawerHeader(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              accountName: Row(
                                children: <Widget>[
                                  Text(
                                    userName,
                                    style: TextStyle(
                                        color: DataProvider().primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                              accountEmail: Row(
                                children: <Widget>[
                                  Text(userEmail,
                                      style: TextStyle(
                                          color: DataProvider().primary,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              currentAccountPicture: InkWell(
                                child: new CircleAvatar(
                                  backgroundImage: NetworkImage(userImage),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 50, bottom: 50),
                                        child: Material(
                                          child: Icon(Icons.edit,
                                              color: DataProvider().primary),
                                          color: Colors.white,
                                          elevation: 10.1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditAccount()));
                                },
                              ),
                            )
                          else
                            UserAccountsDrawerHeader(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              accountName: Row(
                                children: <Widget>[
                                  InkWell(
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translateString("sign_in"),
                                      style: TextStyle(
                                          color: DataProvider().primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                  ),
                                ],
                              ),
                              accountEmail: Row(
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context)
                                        .translateString("dont_account"),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    child: Text(
                                        AppLocalizations.of(context)
                                            .translateString("sign_up"),
                                        style: TextStyle(
                                            color: DataProvider().primary,
                                            fontWeight: FontWeight.bold)),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()));
                                    },
                                  ),
                                ],
                              ),
                              currentAccountPicture: InkWell(
                                child: new CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png"),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 50, bottom: 50),
                                        child: Material(
                                          child: Icon(
                                            Icons.edit,
                                            color: DataProvider().primary,
                                          ),
                                          color: Colors.white,
                                          elevation: 10.1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditAccount()));
                                },
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.language,color: DataProvider().primary,),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  onChanged: (String language) {
                                    setState(() {
                                      dropdownValue = language;
                                      Translation().setlang = language;
                                    });
                                  },
                                  items: <String>[
                                    'English',
                                    'Arabic',
                                    'French',
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ]),
                          ),
                          Divider(),
                          DrawerlistTile(
                              Icons.favorite,
                              AppLocalizations.of(context)
                                  .translateString("wishlist"), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Wishlist()));
                          }),
                          DrawerlistTile(
                              Icons.local_offer,
                              AppLocalizations.of(context)
                                  .translateString("my_order"),
                              () {}),
                          DrawerlistTile(
                              Icons.category,
                              AppLocalizations.of(context)
                                  .translateString("categories"),
                              () {}),
                          DrawerlistTile(
                              Icons.local_shipping,
                              AppLocalizations.of(context)
                                  .translateString("delivery"),
                              () {}),
                          DrawerlistTile(
                              Icons.local_mall,
                              AppLocalizations.of(context)
                                  .translateString("terms"), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Terms()));
                          }),
                          DrawerlistTile(
                              Icons.help,
                              AppLocalizations.of(context)
                                  .translateString("faq"), () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => FAQ()));
                          }),
                          DrawerlistTile(
                              Icons.phone,
                              AppLocalizations.of(context)
                                  .translateString("contact_us"), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContactUs()));
                          }),
                          if (isLogin)
                            DrawerlistTile(Icons.exit_to_app, 'Logout',
                                () async {
                              ShowAlertDailog();
                            }),
                        ],
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          HomeScreenTop(AppLocalizations.of(context)
                              .translateString("search_text")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translateString("categories"),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),

                          CategoriesList(),
                          Offers(AppLocalizations.of(context)
                              .translateString("shop_now")),
                          //Mygrid(),
                          HomeOffers(
                              AppLocalizations.of(context)
                                  .translateString("most_popular"),
                              "popular",
                              MyBanner(myImageurl)),
                          HomeOffers(
                              AppLocalizations.of(context)
                                  .translateString("new_arrival"),
                              "new",
                              MyBanner(myImageurl2)),
                        ],
                      ),
                    ))));
  }

  Future check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("none");
      setState(() {
        connected = false;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        connected = true;
      });

      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        connected = true;
      });

      // I am connected to a wifi network.
    }
  }

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if ((prefs.containsKey('userName') &&
          prefs.containsKey('userEmail') &&
          prefs.containsKey('userImage'))) {
        userName = prefs.getString('userName');
        userEmail = prefs.getString('userEmail');
        userImage = prefs.getString('userImage');
      } else {
        isLogin = false;
      }
    });
  }

  Future<void> ShowAlertDailog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          title: Text('Are you Sure ?'),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: DataProvider().primary,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        isLogin = false;
                        prefs.clear();
                        AuthProvider().googleLogout();
                        AuthProvider().logoutFace();
                      });
                      await Navigator.of(context).pop();
                    },
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// DrawerList take 3 parmeters title - icon- onclickfun()

class DrawerlistTile extends StatelessWidget {
  IconData draweIcon;
  String drawerItem;
  Function drawerOnTap;
  DrawerlistTile(this.draweIcon, this.drawerItem, this.drawerOnTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: drawerOnTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(draweIcon, color: DataProvider().primary),
            SizedBox(width: 8),
            Text(drawerItem),
          ],
        ),
      ),
    );
  }
}

//Top Part of the Home page Srarch & Carsoul ---Torres---

class HomeScreenTop extends StatefulWidget {
  String searchText;
  HomeScreenTop(this.searchText);
  HomeScreenTopState createState() => HomeScreenTopState();
}

class HomeScreenTopState extends State<HomeScreenTop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Styles.appFirstColor, Styles.appSecondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: widget.searchText,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 14.0),
                          suffixIcon: Material(
                            color: Colors.blue[100],
                            elevation: .0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 80, left: 15, right: 15),
          child: SizedBox(
              height: 180.0,
              child: Carousel(
                boxFit: BoxFit.fill,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 4.0,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  NetworkImage(
                      'https://www.digitaldealer.com/wp-content/uploads/2017/11/Screen-Shot-2017-11-03-at-8.18.36-AM.png'),
                  NetworkImage(
                      'http://oreva.com/wp-content/uploads/2018/09/banner-10.jpg'),
                  NetworkImage(
                      "https://freedesignfile.com/upload/2017/09/Young-woman-shopping-online-at-home-Stock-Photo-19.jpg"),
                ],
              )),
        ),
      ],
    );
  }
}

class CategoriesList extends StatelessWidget {
  /* static List<String> catNames = [
    'Fashion',
    'Electronics',
    'Home & Kitchen',
    'Phones & Tablet',
    'Beauty & Health'
  ];
  static List<IconData> icon = [
    Shopping.fashion,
    Shopping.electronics,
    Shopping.furniture,
    Shopping.mobile,
    Shopping.health
  ];
  static List<LinearGradient> myColors = [
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catOneFirstColor, Styles.catOneSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catTwoFirstColor, Styles.catTwoSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catThreeFirstColor, Styles.catThreeSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catFourFirstColor, Styles.catFourSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catFiveFirstColor, Styles.catFiveSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catSixFirstColor, Styles.catSixSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catSevenFirstColor, Styles.catSevenSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catEightFirstColor, Styles.catEightSceondColor]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Styles.catNineFirstColor, Styles.catNineSceondColor]),

      var data = json.decode(res.body);
      var rest = data["data"] as List;
      print(rest.toString());

  final List<Category> categories = [
    for (var i = 0; i < catNames.length; i++)
      Category(catNames[i], myColors[i], icon[i]),
  ];
  //  [
  //   Category('Fashion', myColors[0], Shopping.fashion),
  //   Category('Electronics', myColors[1], Shopping.electronics),
  //   Category('Furniture', myColors[2], Shopping.furniture),
  //   Category('Phones and Tablet', myColors[3], Shopping.mobile),
  //   Category('Beauty & Health', myColors[4], Shopping.health),
  // ];
*/

  Future<List<Category>> fetchdata() async {
    final res = await http.get("http://18.217.190.199/api/categories");
    List<Category> list;
    print(res.statusCode.toString());

    if (res.statusCode == 200) {
      print(res.statusCode.toString());

      var data = json.decode(res.body);
      var rest = data["data"] as List;
      print(rest.toString());

      list = rest.map<Category>((json) => Category.fromJson(json)).toList();
    }
    print(list.length.toString());
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.20,
      child: FutureBuilder<List<Category>>(
          future: fetchdata(),
          builder: (context, snapshot) {
            List<Category> mylist = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mylist.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(int.parse(mylist[index].fColor)),
                                Color(int.parse(mylist[index].lColor))
                              ]),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SubCategory(
                                          catID: mylist[index].id,
                                          subtitle: mylist[index].name,
                                        )));
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(bottom: 7.0),
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    child: Icon(
                                      IconData(
                                          int.parse(mylist[index].iconCode),
                                          fontFamily: mylist[index].iconFont),
                                      color: Colors.white,
                                    )),
                                Text(
                                  mylist[index].name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ));
                  }));
            } else {
              return Text("Loading...");
            }
          }),
    );
  }
}

//offers Part Two Cards ---------Torres

class Offers extends StatefulWidget {
  String shop_now;
  Offers(this.shop_now);
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  void initState() {
    super.initState();
    //Translation().setlang = widget.lang;
    //print("offers");
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 10, children: <Widget>[
      Card(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .4,
              height: 180,
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2017/08/06/17/58/people-2594683_960_720.jpg',
                  fit: BoxFit.fill),
            ),
            Text(
              ' New \n Collection',
              style: TextStyle(color: Colors.white),
            ),
            Positioned(
              top: 135,
              right: 10,
              child: ButtonTheme(
                minWidth: 30,
                height: 30,
                child: RaisedButton(
                  child: Text(
                    widget.shop_now,
                    //AppLocalizations.of(context).translateString('title_home'),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => Malls()));
                  },
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
      Card(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .4,
              height: 180,
              child: Image.network(
                  'https://img.freepik.com/free-photo/portrait-smiling-woman-with-shopping-bags-smartphone_1262-14313.jpg?size=626&ext=jpg',
                  fit: BoxFit.fill),
            ),
            Text(
              'New \n Collection',
              style: TextStyle(color: Colors.white),
            ),
            Positioned(
              top: 135,
              right: 10,
              child: ButtonTheme(
                minWidth: 30,
                height: 30,
                child: RaisedButton(
                  child: Text(
                    widget.shop_now,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  onPressed: () {},
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

// Banner Part to show banner image
String myImageurl =
    'https://assets.tatacliq.com/medias/sys_master/images/13615969468446.jpg';
String myImageurl2 =
    'https://incipio.com/pub/media/catalog/category/iphone-x-category-banner.jpg';

class MyBanner extends StatelessWidget {
  String imageurl;
  MyBanner(this.imageurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.150,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        imageurl,
        fit: BoxFit.fill,
      ),
    );
  }
}

// offers like most arraival & best seller
//take title & bannerimage from banner class and will take List of proucdes

class HomeOffers extends StatelessWidget {
  final String offerTitle;
  final MyBanner banner;
  final String state;

  Future<List<Data>> fetchdata() async {
    final res = await http.get("http://18.217.190.199/api/products/$state");
    List<Data> list;

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      list = data.map<Data>((json) => Data.fromJson(json)).toList();
    }
    return list;
  }

  HomeOffers(this.offerTitle, this.state, [this.banner]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            banner,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    offerTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              height: MediaQuery.of(context).size.height * 0.42,
              child: FutureBuilder<List<Data>>(
                  future: fetchdata(),
                  builder: (context, snapshot) {
                    List<Data> mylist = snapshot.data;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mylist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ProductDetails(mylist[index].id)));
                            },
                            child: Container(
                                width: 165,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Material(
                                        child: InkWell(
                                          child: Image.network(
                                            mylist[index].cover,
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                      Wrap(children: <Widget>[
                                        Text(
                                          '5000 EGP',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          mylist[index].price,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          size: 18,
                                        ),
                                      ]),
                                      Wrap(children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            mylist[index].description,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 4,
                                          ),
                                        )
                                      ]),
                                    ],
                                  ),
                                )),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
