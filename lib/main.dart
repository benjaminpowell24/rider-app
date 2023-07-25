
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rider/screens/mainpage.dart';
import 'package:rider/screens/registrationpage.dart';
import 'dart:io';

import 'package:rider/screens/riderinfo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db3',
    options: Platform.isIOS
        ? FirebaseOptions(
      appId: 'AIzaSyCtbd_ikhuo9yc271_8MrUXhIVWo-BCxUc',
      apiKey: 'AIzaSyA-Pq7L_w4CTLTAQX76fUu8q7UGr1WetIs',
      projectId: 'ermnl-d5ddc',
      messagingSenderId: '645583398956',
      databaseURL: 'https://ermnl-d5ddc-default-rtdb.firebaseio.com',
    )
        : FirebaseOptions(
      appId: '1:645583398956:android:b2ef31af346743be2c8989',
      apiKey: 'AIzaSyA-Pq7L_w4CTLTAQX76fUu8q7UGr1WetIs',
      messagingSenderId: '297855924061',
      projectId: 'ermnl-d5ddc',
      databaseURL: 'https://ermnl-d5ddc-default-rtdb.firebaseio.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MainPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        RiderInfoPage.id: (context) => RiderInfoPage(),
      },
    );
  }
}
