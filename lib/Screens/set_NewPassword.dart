import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/DataProvider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
class SetNewPassword extends StatefulWidget {
  _SetNewPassword createState() => _SetNewPassword();
}
class _SetNewPassword extends State<SetNewPassword> {

  Color danger=Colors.deepPurple;
   TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        body: SafeArea(
                  child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      IconButton(icon:Icon(Icons.arrow_back),onPressed: (){},alignment: Alignment.centerLeft,),
                      SizedBox(height: 30,),
                      Text(
                        '',
                        style: TextStyle(
                            color: DataProvider().primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            height: 2.5),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20,),
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: dataProvider.securePassword,
                           controller: passwordController,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Password',
                            // icon: new Icon(Icons.lock_outline),
                            suffixIcon: new IconButton(
                              icon: new Icon(
                                Icons.remove_red_eye,color: danger,
                              ),
                              onPressed: () {
                               if(danger==Colors.deepPurple)
                               {
                                 setState(() {
                                  danger=Colors.red; 
                                 });
                               }else if(danger==Colors.red)
                               {
                                 setState(() {
                                  danger=Colors.deepPurple; 
                                 });
                               } 
                                  bool viewHide =
                                  dataProvider.securePassword == true ? false : true;
                                  dataProvider.securePassword = viewHide;
                              },
                            ),
                          ),
                          
                          onSaved: (value) {},
                        ),
                      ),
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: dataProvider.securePassword,
                           controller: passwordController,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Confirm new Password',
                            // icon: new Icon(Icons.lock_outline),
                            suffixIcon: new IconButton(
                              icon: new Icon(
                                Icons.remove_red_eye,color: danger,
                              ),
                              onPressed: () {
                               if(danger==Colors.deepPurple)
                               {
                                 setState(() {
                                  danger=Colors.red; 
                                 });
                               }else if(danger==Colors.red)
                               {
                                 setState(() {
                                  danger=Colors.deepPurple; 
                                 });
                               } 
                                  bool viewHide =
                                  dataProvider.securePassword == true ? false : true;
                                  dataProvider.securePassword = viewHide;
                              },
                            ),
                          ),
                          
                          onSaved: (value) {},
                        ),
                      ),
                      ButtonTheme(
                        minWidth: double.infinity,
                        height: 50.0,
                          child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          onPressed: (){
                            // print(emailController.text);                            
                          //  emailController.clear();
                            },
                          child: Text("Forget Password",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                            ),
                          color: DataProvider().primary),
                      ),
                      SizedBox(height: 10,),
                      Text('Sign In With',style: TextStyle(color: DataProvider().primary,fontSize:18),),
                      SizedBox(height: 20,),
                       
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
