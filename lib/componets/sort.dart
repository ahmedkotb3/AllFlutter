import 'package:flutter/material.dart';

class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            //elevation:14.0,
            color: Color(0xFF737373),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color(0xFF5d5e62).withOpacity(0.3)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Filter',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Color(0XFF193ca1),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                child:ListView(
                  children: <Widget>[
                    _createTile(context, 'Top Selling', _action1),
                    _createTile(context, 'Position', _action2),
                    _createTile(context, 'Name', _action3),
                    _createTile(context, 'Price', _action3),
                    _createTile(context, 'Top Selling', _action3),
                    _createTile(context, 'Top Selling', _action3),
                    _createTile(context, 'Top Selling', _action3),
                  ],
                ),
                ),
              ],
            ),
          );
        });
  }

  ListTile _createTile(BuildContext context, String name, Function action) {
    return ListTile(
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        action();
        //SetState()
      },
    );
  }

  _action1() {
    print('action 1');
  }

  _action2() {
    print('action 2');
  }

  _action3() {
    print('action 3');
  }
}
