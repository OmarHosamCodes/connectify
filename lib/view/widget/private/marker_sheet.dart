// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:connectify/library.dart';

class MarkerDialog extends StatelessWidget {
  const MarkerDialog({super.key, required this.marker});

  BuildContext get context => RoutingController.context;

  final CustomMarker marker;

  Future<void> show() {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
          maxHeight: context.height * 0.8, minWidth: context.width),
      context: context,
      builder: (_) => MarkerDialog(marker: marker),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomGlassMorphismContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(SimpleConstants.radius),
        topRight: Radius.circular(SimpleConstants.radius),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: context.width,
            child: CustomImage(
              source: marker.imageUrl,
              height: 100,
              width: context.width,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListTileTheme(
              textColor: const Color(0xFFf7f7f7),
              iconColor: const Color(0xFFf7f7f7),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(marker.title),
                    subtitle: Text(marker.category),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(marker.description),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton.raised(
                onPressed: () {
                  context.pop();
                  // context.push(Routes.directions);
                },
                child: const CustomText(
                  text: 'Enroll',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMarker extends Marker {
  const CustomMarker({
    required this.id,
    required this.creatorID,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.markerPosition,
    required super.markerId,
    super.onTap,
  });

  final String id;

  final String creatorID;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final Position markerPosition;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'markerId': markerId.value,
      'id': id,
      'creatorID': creatorID,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'markerPosition': markerPosition.toLatLng.toJson(),
    };
  }

  factory CustomMarker.fromMap(Map<String, dynamic> map) {
    return CustomMarker(
      markerId: MarkerId(map['id'] as String),
      id: map['id'] as String,
      creatorID: map['creatorID'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      category: map['category'] as String,
      markerPosition:
          Position.fromMap(map['markerPosition'] as Map<String, dynamic>),
    );
  }
}
