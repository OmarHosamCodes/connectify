import 'package:connectify/library.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectify'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.push(Routes.search),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final positionWatcher = ref.watch(getPositionProvider);
          return positionWatcher.when(
            data: (position) {
              return GoogleMap(
                mapType: MapType.normal,
                markers: {
                  CustomMarker(
                    id: UniqueKey().toString(),
                    markerPosition: position,
                    creatorID: 'myLocation',
                    title: 'English Tutor',
                    description:
                        'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    imageUrl: 'https://placehold.co/600x400/png',
                    category: 'Tutoring',
                    markerId: const MarkerId('myLocation'),
                    onTap: () {
                      MarkerDialog(
                          marker: CustomMarker(
                        id: UniqueKey().toString(),
                        markerPosition: position,
                        creatorID: 'myLocation',
                        title: 'English Tutor',
                        description:
                            'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        imageUrl: 'https://placehold.co/600x400/png',
                        category: 'Tutoring',
                        markerId: const MarkerId('myLocation'),
                      )).show();
                    },
                  ),
                },
                polygons: {
                  Polygon(
                    polygonId: const PolygonId('myLocation'),
                    points: [
                      LatLng(position.latitude - 0.0001,
                          position.longitude - 0.0001),
                      LatLng(position.latitude + 0.0001,
                          position.longitude - 0.0001),
                      LatLng(position.latitude + 0.0001,
                          position.longitude + 0.0001),
                      LatLng(position.latitude - 0.0001,
                          position.longitude + 0.0001),
                    ],
                    strokeWidth: 2,
                    strokeColor: Colors.blue,
                    fillColor: Colors.blue.withOpacity(0.5),
                  ),
                },
                mapToolbarEnabled: false,
                compassEnabled: false,
                trafficEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: position.toCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  MapController.instance.controller.complete(controller);
                },
              );
            },
            loading: CustomPopups.loadingDialog,
            error: (error, stackTrace) => Text('Error: $error'),
          );
        },
      ),
    );
  }
}
