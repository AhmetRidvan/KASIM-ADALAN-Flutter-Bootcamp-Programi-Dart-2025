import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  List<Marker> markers = [];
  Completer<GoogleMapController> g1 = Completer();

  final startFromHere = CameraPosition(
    target: LatLng(40.9897999, 28.9487123),
    zoom: 11,
  );

  Future<void> goThere() async {
    final controller = await g1.future;
    final goThere = CameraPosition(
      target: LatLng(41.1103403, 28.2142712),
      zoom: 15,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(goThere));
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(41.1103403, 28.2142712),
          infoWindow: InfoWindow(title: "Buraya gittiniz", snippet: "Meydan"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Use of map")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: GoogleMap(
                markers: Set<Marker>.of(markers),
                mapType: MapType.normal,
                initialCameraPosition: startFromHere,
                onMapCreated: (controller) {
                  g1.complete(controller);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                goThere();
              },
              child: Text("Go to the location"),
            ),
          ],
        ),
      ),
    );
  }
}
