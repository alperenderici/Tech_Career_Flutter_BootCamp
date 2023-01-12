import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUsage extends StatefulWidget {
  const MapUsage({super.key});

  @override
  State<MapUsage> createState() => _MapUsageState();
}

class _MapUsageState extends State<MapUsage> {
  // 39.9032923,32.6226799,11z
  // 41.0370014,28.9763369,15z

  Completer<GoogleMapController> mapControll = Completer();

  var startingPosition = CameraPosition(
      target: LatLng(
        39.9032923,
        32.6226799,
      ),
      zoom: 11);

  Future<void> goLocation() async {
    GoogleMapController controller = await mapControll.future;
    var endPosition =
        CameraPosition(target: LatLng(41.0370014, 28.9763369), zoom: 15);
    controller.animateCamera(CameraUpdate.newCameraPosition(endPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konum kullanimi"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: GoogleMap(
              initialCameraPosition: startingPosition,
              onMapCreated: (controller) {
                mapControll.complete(controller);
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                goLocation();
              },
              child: const Text("Konum bilgisi al."))
        ],
      )),
    );
  }
}
