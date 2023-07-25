import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

User currentFirebaseUser;

String mapKey = 'AIzaSyCWRMJ8xYasQhUa7gXM4QtwVKX25HzkmYs';


final CameraPosition googlePlex = CameraPosition(
  target: LatLng(5.657930, -0.022959),
  zoom: 14.4746,
);


StreamSubscription<Position> homeTabPositionStream;
