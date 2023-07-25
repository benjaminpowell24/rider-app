import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/brand_colors.dart';
import 'package:rider/globalvariables.dart';
import 'package:rider/widgets/AvailabilityButton.dart';
import 'package:rider/widgets/ConfirmSheet.dart';
import 'package:rider/widgets/ourbutton.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  Position currentPosition;

  DatabaseReference tripRequestRef;

  var geoLocator = Geolocator();
  Geolocator geolocatorTwo;
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 4);


  void getCurrentPositiion() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
     currentPosition = position;
     LatLng pos = LatLng(position.latitude, position.longitude);
     mapController.animateCamera((CameraUpdate.newLatLng(pos)));
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          padding: EdgeInsets.only(top: 135),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: googlePlex,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
            mapController=controller;

            getCurrentPositiion();
          },
        ),
        // Container(
        //   height: 135,
        //   width:double.infinity,
        //   color: BrandColors.colorPrimary,
        //
        // ),

        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvailabilityButton(
                title: 'Go Online',
                color: BrandColors.colorOrange,
                onPressed: () {

                  GoOnline();
                  getLocationUpdates();

                  // showModalBottomSheet(
                  //   isDismissible: false,
                  //     context: context,
                  //     builder: (BuildContext context) => ConfirmSheet(),
                  // );
                },
              ),
            ],
          ),
        ),

      ],
    );
  }

  void GoOnline(){
    Geofire.initialize('driversAvailable');
    Geofire.setLocation(currentFirebaseUser.uid, currentPosition.latitude, currentPosition.longitude);

    tripRequestRef  = FirebaseDatabase.instance.reference().child('drivers/${currentFirebaseUser.uid}/newtrip');
    tripRequestRef.set('waiting');

    tripRequestRef.onValue.listen((event) {

    });
  }

    void getLocationUpdates(){


      homeTabPositionStream = Geolocator.getPositionStream().listen((Position position) {

        currentPosition = position;
        Geofire.setLocation(currentFirebaseUser.uid, position.latitude, position.longitude);

        LatLng pos = LatLng(position.latitude, position.longitude);
        mapController.animateCamera(CameraUpdate.newLatLng(pos));

      });

  }
}
