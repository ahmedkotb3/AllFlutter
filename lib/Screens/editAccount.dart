import 'dart:convert';
import 'dart:io';
import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Screens/changePassword.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  String userImage =
      "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png";
  bool addImage = false;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImage2() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    //convert image to base64 or Bytes
    List<int> imageBytes = await _image.readAsBytes();
    print("Image Bytes////////$imageBytes");
    String base64Image = base64Encode(imageBytes);
    print("image in base 64/// $base64Image");
  }

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
                    _image == null
                        ? CircleAvatar(
                            radius: 65.0,
                            child: InkWell(
                              child: Image.network(userImage),
                              onTap: () {
                                setState(() {
                                  if (addImage == false) {
                                    addImage = true;
                                  } else if (addImage == true) {
                                    addImage = false;
                                  }
                                });
                              },
                            ),
                          )
                        : CircleAvatar(
                            radius: 65.0,
                            backgroundImage: new FileImage(_image),
                            child: InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    if (addImage == false) {
                                      addImage = true;
                                    } else if (addImage == true) {
                                      addImage = false;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                  ],
                ),
                addImage
                    ? new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: getImage,
                            icon: Icon(Icons.linked_camera),
                            iconSize: 30.0,
                            color: ColorProvider().primary,
                          ),
                          IconButton(
                            onPressed: getImage2,
                            icon: Icon(Icons.add_photo_alternate),
                            iconSize: 30.0,
                            color: ColorProvider().primary,
                          ),
                        ],
                      )
                    : SizedBox(height: hieghtAll),
                new Text(
                  "Account Information",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: hieghtAll),
                buildTextForm(
                    nameController, username, "Name", null, TextInputType.text),
                SizedBox(height: hieghtAll),
                buildTextForm(phoneController, userPhone, "Phone", null,
                    TextInputType.phone),
                SizedBox(height: hieghtAll),
                buildTextForm(emailController, userEmail, "Email", null,
                    TextInputType.emailAddress),
                SizedBox(height: hieghtAll),
                InkWell(
                  child: buildTextForm(null, "Edit Password", null,
                      Icon(Icons.edit), null, false, 1, false),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePassword()),
                    );
                  },
                ),
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
                      if (emailController.text != '') {
                        userEmail = emailController.text;
                      }
                      if (phoneController.text != '') {
                        userPhone = phoneController.text;
                      }
                      if (nameController.text != '') {
                        username = nameController.text;
                      }
                      //    if(newAddressController.text!=''){userAddress=newAddressController.text;}
                    });
                    print(
                        'username ${username}-phone ${userPhone}-email${userEmail}');
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
      [String sideText,
      Icon sideIcon,
      TextInputType mytype,
      bool secret = false,
      int lines,
      bool Enabled = true]) {
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
