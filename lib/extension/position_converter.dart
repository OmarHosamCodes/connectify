import 'package:connectify/library.dart';

extension PositionConverter on Position {
  CameraPosition get toCameraPosition {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 0,
    );
  }
}
