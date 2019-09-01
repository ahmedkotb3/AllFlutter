import 'package:big/Screens/ContactUs.dart';
import 'package:big/Screens/FAQ.dart';
import 'package:big/Screens/Settings.dart';
import 'package:big/Screens/SubCategory.dart';
import 'package:big/Screens/Terms.dart';
import 'package:big/Screens/cart.dart';
import 'package:big/Screens/login.dart';
import 'package:big/Screens/whishlist.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:big/Screens/mall.dart';
import 'package:big/Providers/Styles.dart';


class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLogin=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HomeScreen',
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();

                },
              ),
              elevation: 0,
              titleSpacing: 50,
              title: new Text("My Title"),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => CartPage()));
                  },
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[

                  UserAccountsDrawerHeader(
                    accountName: Text('EsamMax'),
                    accountEmail: Text('Esam_Mouhamed'),
                    currentAccountPicture: GestureDetector(
                      child: new CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://freedesignfile.com/upload/2017/09/Young-woman-shopping-online-at-home-Stock-Photo-19.jpg'),
                          child: Stack(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 50, bottom: 50),
                              child: Material(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                color: Colors.blue[100],
                                elevation: .1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                              ),
                            )
                          ])),
                    ),
                  ),
                  Divider(),
                 if(!isLogin) DrawerlistTile(Icons.account_circle, 'Login', () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));

                 }),
                  DrawerlistTile(Icons.favorite, 'WishList', () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Wishlist()));
                  }),
                  DrawerlistTile(Icons.settings, 'Settings', () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Settings()));

                  }),
                  DrawerlistTile(Icons.local_offer, 'My Orders', () {}),
                  DrawerlistTile(Icons.category, 'Categories', () {

                  }),
                  DrawerlistTile(Icons.local_shipping,
                      'Delivery & Shipping Istructions', () {}),
                  DrawerlistTile(Icons.local_mall, 'Terms & Conditions', () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Terms()));

                  }),
                  DrawerlistTile(Icons.help, 'FAQ', () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => FAQ()));
                  }),
                  DrawerlistTile(Icons.phone, 'Contact Us', () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ContactUs()));
                  }),
                  if (isLogin)  DrawerlistTile(Icons.exit_to_app, 'Logout', () {}),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HomeScreenTop(),
                  CategoriesList(),
                  Offers(),
                  //Mygrid(),
                  HomeOffers('Most Popular', MyBanner(myImageurl)),
                  HomeOffers('New Arrival', MyBanner(myImageurl2)),
                ],
              ),
            )));
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
            Icon(
              draweIcon,
              color: Colors.blue,
            ),
            SizedBox(
              width: 8,
            ),
            Text(drawerItem),
          ],
        ),
      ),
    );
  }
}




//Top Part of the Home page Srarch & Carsoul ---Torres---

class HomeScreenTop extends StatefulWidget {
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

                colors: [
                  Styles.appFirstColor,
                  Styles.appSecondColor
                ]
              )
            ),







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
                          hintText: 'What are you looking for?',
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





// Categories Part --------Torres

class CategoriesList extends StatelessWidget {
  final List<String> numbers = [
    'Beauty',
    'Phones',
    'Frniture',
    'Fashion',
    'Electronics'
  ];
  final List<Color> myColors = [
    Colors.teal,
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.indigo
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Card(
                color: myColors[index],
                child:InkWell (onTap: (){

                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SubCategory()));
                },
                                  child: Container(
                    child: Center(
                        child: Text(
                      numbers[index],
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )),
                  ),
                ),
              ),
            );
          }),
    );
  }
}





//offers Part Two Cards ---------Torres

class Offers extends StatelessWidget {
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
                    'Shop now',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Malls()));
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
                    'Shop now',
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

  HomeOffers(this.offerTitle, this.banner);

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
                Text(
                  offerTitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
             height: MediaQuery.of(context).size.height * 0.42,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(

    
                        width: 165,
                        child: Card(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Material(
                                
                                child: InkWell(
                                  
                                  child: Image.network(
                                    'https://mobizil.com/wp-content/uploads/2018/09/xs-colors-1.jpg',
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *0.2,
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
                                Text('8000 EGP',
                                    style: TextStyle(fontSize: 12),),
                                SizedBox(
                                  width: 6,
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  size: 18,
                                ),
                              ]),
                              Wrap(
                                  children:<Widget>[ Text(
                                'Apple Iphone X With Facetime - 64 GB, 4G LTE, Silver, 3 GB Ram, Single Sim ',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                  )]),
                            ],
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}










