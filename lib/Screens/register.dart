import 'package:flutter/material.dart';
import '../Providers/DataProvider.dart';
import 'package:provider/provider.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color danger=Colors.deepPurple;
   TextEditingController emailController,passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
     builder: (BuildContext context) => DataProvider(),
     child: Scaffold(
       body: SingleChildScrollView(
         child: Container(
           child: Center(
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                 children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                          Text(
                      'Create New Account',
                      style: TextStyle(
                          color: DataProvider().primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          height: 2.5),
                      textAlign: TextAlign.center,
                    ),
                     SizedBox(height: 20,),
                     
                     ],
                   ),
                   Consumer<DataProvider>(
                      builder: (context, stateManager, _) =>
                      TextFormField(
                      decoration: InputDecoration(
                       labelText:'Name',labelStyle: TextStyle(fontSize: 23),
                       ),
                       validator: (value){},
                       onSaved: (value){},
                   ),
                   ),
                     Consumer<DataProvider>(
                      builder: (context, stateManager, _) =>
                      TextFormField(
                      decoration: InputDecoration(
                       labelText:'Email',labelStyle: TextStyle(fontSize: 23),
                       ),
                       validator: (value){},
                       onSaved: (value){},
                   ),
                   ),
                       Consumer<DataProvider>(
                      builder: (context, dataProvider, _) => TextFormField(
                        obscureText: dataProvider.securePassword,
                        controller: passwordController,
                        maxLength: 32,
                        decoration: InputDecoration(
                          labelText: 'Password',labelStyle: TextStyle(fontSize: 23), 
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
                 ],
               ),
             ),
           ),
         ),
       ),
     ),
      
    );
  }
}