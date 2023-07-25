import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider/brand_colors.dart';
import 'package:rider/globalvariables.dart';
import 'package:rider/screens/mainpage.dart';
import 'package:rider/widgets/ourbutton.dart';

class RiderInfoPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar (String title){
    final snackbar = SnackBar(
      content: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  static const String id = "riderinfo";

  var motorModelController = TextEditingController();
  var motorColorController = TextEditingController();
  var motorNumberController = TextEditingController();

  
  void updateProfile (){
    String id = currentFirebaseUser.uid;
    DatabaseReference riderRef;
    FirebaseDatabase.instance.reference().child('riders/$id/riderdetails');
    
    Map map = {
      'motor_color': motorColorController,
      'motore_number': motorNumberController,
      'motor_model': motorModelController,
    };
    riderRef.set(map);
    
    // Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),

              Image.asset('images/logo.png', height: 110, width: 110,),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Column(
                  children: <Widget>[

                    SizedBox(height: 10,),

                    Text('Enter vehicle details'),

                    SizedBox(height: 25,),

                    TextField(
                      controller: motorColorController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Car model',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    SizedBox(height: 10,),

                    TextField(
                      controller: motorModelController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Car model',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    TextField(
                      controller: motorNumberController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Car model',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    SizedBox(height: 10,),

                    OurButton(
                      color: BrandColors.colorGreen,
                      title: 'PROCEED',
                      onPressed: (){

                        if(motorColorController.text.length < 3){
                          showSnackBar('please provide the right information');
                          return;
                        }

                        if(motorNumberController.text.length < 3){
                          showSnackBar('please provide the right information');
                          return;
                        }

                        if(motorModelController.text.length < 3){
                          showSnackBar('please provide the right information');
                          return;
                        }


                      },
                    )


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
