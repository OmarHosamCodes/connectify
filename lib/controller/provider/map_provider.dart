import 'package:connectify/library.dart';

final mapControllerProvider = Provider((ref) => MapController());

final getPositionProvider = FutureProvider<Position>((ref) async {
  final mapController = ref.read(mapControllerProvider);
  return await mapController.determinePosition();
});
