import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
//import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetLocation>(_onGetLocation);
  }

  Future<void> _onGetLocation(
      GetLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(LocationError(message: 'Location services are disabled.'));
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LocationError(message: 'Location access denied.'));
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(LocationError(
            message:
                'Access to the location is permanently denied. Change this in settings.'));
        return;
      }
      Position position = await Geolocator.getCurrentPosition();
      emit(LocationLoaded(
          position: LatLng(position.latitude, position.longitude)));
    } catch (e) {
      emit(LocationError(message: 'Error getting location: $e'));
    }
  }
}
