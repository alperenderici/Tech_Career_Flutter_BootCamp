import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationUsage extends StatefulWidget {
  const LocationUsage({super.key});

  @override
  State<LocationUsage> createState() => _LocationUsageState();
}

class _LocationUsageState extends State<LocationUsage> {
  double enlem = 0.0;
  double boylam = 0.0;

  Future<void> getLocationInfo() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      enlem = location.latitude;
      boylam = location.longitude;
    });
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
          Text(
            "Enlem: $enlem",
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            "Boylam: $boylam",
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                getLocationInfo();
              },
              child: const Text("Konum bilgisi al."))
        ],
      )),
    );
  }
}
