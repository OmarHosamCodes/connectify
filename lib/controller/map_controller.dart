import 'dart:async';

import 'package:connectify/library.dart';

class MapController {
  static final MapController instance = MapController();

  FirebaseAuth get authInstants => FirebaseAuth.instance;

  FirebaseFirestore get firestoreInstants => FirebaseFirestore.instance;

  FirebaseStorage get storageInstants => FirebaseStorage.instance;

  User? get currentUser => authInstants.currentUser;

  static final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Completer<GoogleMapController> get controller => _controller;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> goToMyLocation() async {
    final position = await determinePosition();
    final _ = await controller.future;
    _.animateCamera(
      CameraUpdate.newCameraPosition(position.toCameraPosition),
    );
  }

  Future<void> addMarker(CustomMarker marker) async {
    if (currentUser != null) {
      final markerRef = firestoreInstants.collection('marker').doc(marker.id);

      await markerRef.set(marker.toJson() as Map<String, dynamic>);
    }
  }
}
