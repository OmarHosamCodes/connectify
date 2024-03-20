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
            onPressed: () {},
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
