import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(40.1792, 44.4991),
          initialZoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            additionalOptions: const {
              'accessToken':
                  'pk.eyJ1IjoiZGFuaWVsZ3JpZyIsImEiOiJjbTV1dGt3MTkwMGNoMnFxejJyaWp0eW40In0.RLGeP_Y2_R0wJ-Q29h2RNg',
              'id': 'mapbox/streets-v11',
            },
          ),
        ],
      ),
    );
  }
}
