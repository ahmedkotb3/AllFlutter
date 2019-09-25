import 'package:flutter/material.dart';
import 'package:big/SizeConfig.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Category(
              imageLocation: 'lib/assets/images/cats/tshirt.png',
              imageCaption: 'shirt',
            ),
            Category(
              imageLocation: 'lib/assets/images/cats/dress.png',
              imageCaption: 'dress',
            ),
            Category(
              imageLocation: 'lib/assets/images/cats/jeans.png',
              imageCaption: 'pants',
            ),
            Category(
              imageLocation: 'lib/assets/images/cats/formal.png',
              imageCaption: 'formal',
            ),
            Category(
              imageLocation: 'lib/assets/images/cats/informal.png',
              imageCaption: 'informal',
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  final color = const Color(0xff2F3B66);

  Category({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      //height: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 26.0, top: 70.0),
                        child: Text(
                          imageCaption,
                          style: TextStyle(
                              color: color,
                              fontSize: SizeConfig.safeBlockHorizontal * 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,
                          image: AssetImage(imageLocation),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
