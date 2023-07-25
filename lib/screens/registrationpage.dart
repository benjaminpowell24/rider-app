
//import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rider/globalvariables.dart';
import 'package:rider/screens/mainpage.dart';
import 'package:rider/widgets/ProgressDialogue.dart';
import 'package:rider/widgets/ourbutton.dart';

import '../brand_colors.dart';

class RegistrationPage extends StatefulWidget {

  static const String id = 'register';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar (String title){
    final snackbar = SnackBar(
      content: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var firstNameController =TextEditingController();

  var lastNameEditingController =TextEditingController();

  var emailEditingController =TextEditingController();

  var phoneNumberEditingController =TextEditingController();

  var passwordEditingController =TextEditingController();

  void RegisterUser() async {

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialog(status: 'Registering you',),
    );


    final User user = (await _auth.createUserWithEmailAndPassword(
    email: emailEditingController.text,
    password: passwordEditingController.text,
    ).catchError((ex){
      Navigator.pop(context);
      PlatformException thisEx =ex;
      showSnackBar(thisEx.message);
    })).user;

    if(user != null){
      DatabaseReference newUserRef = FirebaseDatabase.instance.reference().child('riders/${user.uid}');

      Map userMap = {
        'firstName': firstNameController.text,
        'lastName': lastNameEditingController.text,
        'phoneNumber': phoneNumberEditingController.text,
        'email': emailEditingController.text,
      };

      newUserRef.set(userMap);

      currentFirebaseUser = user;

      Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route)=> false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 70,),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('images/logo.png'),
                ),

                SizedBox(height: 10.0,),

                Text("Sign Up Here",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: "Brand-Bold"),),

                SizedBox(height: 40,),

                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [

                      TextField(
                        controller: firstNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      TextField(
                        controller: lastNameEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      TextField(
                        controller: phoneNumberEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      TextField(
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),


                      TextField(
                        controller: passwordEditingController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 50.0,),

                      OurButton(
                        title: "Registration",
                        color: BrandColors.colorAccentPurple,
                        onPressed: () async {

                          //Check Internet Connectivity
                          //var connectivityResult = await Connectivity().checkConnectivity();
                          // if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi){
                          //   showSnackBar("No internet Connectivity");
                          //   return;
                          // }

                          //Check if Name is more than three characters
                          if (firstNameController.text.length < 3){
                            showSnackBar("Please First Name Is Too Short");
                            return;
                          }

                          if (firstNameController.text.length < 3){
                            showSnackBar("Please Last Name Is Too Short");
                            return;
                          }

                          if (phoneNumberEditingController.text.length < 3){
                            showSnackBar("Please Enter a correct phone number");
                            return;
                          }

                          if (!emailEditingController.text.contains('@')){
                            showSnackBar("Please provide a valid email");
                            return;
                          }

                          if (passwordEditingController.text.length < 8){
                            showSnackBar("Please Enter a correct password");
                            return;
                          }

                          //Check if email is valid
                          RegisterUser();
                        },),



                    ],
                  ),
                ),

                FlatButton(
                  onPressed: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginPage()),
                    // );
                  },
                  child: Text("Already have an account? Login Here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
