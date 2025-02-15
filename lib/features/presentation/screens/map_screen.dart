import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:local_marketplace/features/presentation/bloc/location_bloc.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = MapController();
    return BlocProvider(
      create: (context) => LocationBloc()..add(GetLocation()),
      child: Scaffold(
        appBar: AppBar(title: Text("Map")),
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LocationLoaded) {
              return FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: LatLng(40.1792, 44.4991),
                  initialZoom: 14.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZGFuaWVsZ3JpZyIsImEiOiJjbTV1dGt3MTkwMGNoMnFxejJyaWp0eW40In0.RLGeP_Y2_R0wJ-Q29h2RNg",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: state.position,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      )
                    ],
                  )
                ],
              );
            } else if (state is LocationError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const Center(
              child: Text('LocationInitial'),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'zoomIn',
              onPressed: () {
                mapController.move(mapController.camera.center,
                    mapController.camera.zoom + 1);
              },
              shape: CircleBorder(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 33, 243, 54),
                      const Color.fromARGB(255, 255, 242, 62)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(Icons.add,
                    color: const Color.fromARGB(255, 0, 0, 0), size: 35),
              ),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'zoomOut',
              onPressed: () {
                mapController.move(mapController.camera.center,
                    mapController.camera.zoom - 1);
              },
              shape: CircleBorder(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 33, 243, 54),
                      const Color.fromARGB(255, 255, 242, 62)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(Icons.remove,
                    color: const Color.fromARGB(255, 0, 0, 0), size: 35),
              ),
            )
          ],
        ),
      ),
    );
  }
}
