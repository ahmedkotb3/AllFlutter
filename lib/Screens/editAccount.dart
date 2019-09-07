import 'dart:io';
import 'package:big/Providers/ColorsProvider.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController newAddressController = new TextEditingController();
  String username = "mohamed";
  String userPhone = "01564654343";
  String userEmail = "mohamed.essam9393@gmail.com";
  String userImage="https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png";
  bool addImage=false;
//  String userAddress =
//      "nvfjnvfjknvkjnnvkvndknvfkndfnjknvfjknvffvjnjnvjfnkjfvnjkvn";
//  bool editAddress = false;
  double hieghtAll = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanDown: (_) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 65.0,
                      child:InkWell(child: Image.network(userImage),
                      onTap: (){
                        setState(() {
                          if(addImage==false){
                            addImage=true;
                          }
                          else if(addImage==true){
                            addImage=false;
                          }
                        });
                      },
                      ),
                    ),
                  ],
                ),
               addImage? new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.linked_camera),
                      iconSize: 30.0,
                      color: ColorProvider().primary,
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.add_photo_alternate),
                      iconSize: 30.0,
                      color: ColorProvider().primary,
                    ),
                  ],
                ):
                SizedBox(height: hieghtAll),
                new Text(
                  "Account Information",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: hieghtAll),
                buildTextForm(nameController, username, "Name", null, TextInputType.text),
                SizedBox(height: hieghtAll),
                buildTextForm(phoneController, userPhone, "Phone", null, TextInputType.phone),
                SizedBox(height: hieghtAll),
                buildTextForm(emailController, userEmail, "Email", null, TextInputType.emailAddress),
                SizedBox(height: hieghtAll),
//                new Text(
//                  "Address Information",
//                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                ),
//                Column(
//                  children: <Widget>[
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Text(
//                          "Default Address",
//                          style: TextStyle(fontSize: 15.0, color: Colors.blue),
//                        ),
//                        Icon(
//                          Icons.mode_edit,
//                          color: ColorProvider().primary,
//                        ),
//                      ],
//                    ),
//                    InkWell(
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: buildTextForm(newAddressController, userAddress, null,
//                                                null, TextInputType.text, false, 2, editAddress),
//                          ),
//                        ],
//                      ),
//                      onTap: () {},
//                    ),
//                  ],
//                ),
//                SizedBox(height: hieghtAll),
//                new Text(
//                  "Payment Method",
//                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: InkWell(
//                    child: Container(
//                      decoration: BoxDecoration(
//                        border: Border.all(color: Colors.grey),
//                        borderRadius: BorderRadius.circular(5.0),
//                      ),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Text(
//                                "Payment Method",
//                                style: TextStyle(
//                                    fontSize: 15.0, color: Colors.blue),
//                              ),
//                              IconButton(
//                                onPressed: () {},
//                                icon: Icon(
//                                  Icons.arrow_forward_ios,
//                                  color: ColorProvider().primary,
//                                ),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                    onTap: () {},
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                     if(emailController.text!=''){userEmail=emailController.text;}
                     if(phoneController.text!=''){userPhone=phoneController.text;}
                     if(nameController.text!=''){username=nameController.text;}
                 //    if(newAddressController.text!=''){userAddress=newAddressController.text;}
                    });
                    print('username ${username}-phone ${userPhone}-email${userEmail}');
                    //  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Checkout()));
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  color: ColorProvider().primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Container buildTextForm(TextEditingController takeInput, String oldData,
      [String sideText, Icon sideIcon, TextInputType mytype, bool secret = false, int lines, bool Enabled = true])
  {
    return new Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorProvider().primary),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextFormField(
        enabled: Enabled,
        decoration: InputDecoration(
          suffixText: sideText,
          hintText: oldData,
          suffixIcon: sideIcon,
          contentPadding: EdgeInsets.all(15.0),
        ),
        obscureText: secret,
        keyboardType: mytype,
        maxLines: lines,
        controller: takeInput,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: ColorProvider().primary),
      ),
    );
  }
}
