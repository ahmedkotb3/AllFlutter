import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 80.0,
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
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 26.0,top:70.0),
                            child: Text(imageCaption,style: TextStyle(color: color,fontSize: 80.0,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(imageLocation),
                            ),
                          ),
                        ),
                      ],)
                ),
              ),
        ),      ),
    );
  }
}
