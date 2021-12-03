import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learn_flutter/models/restaurant.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantRichView extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantRichView({Key? key, required this.restaurant}) : super(key: key);

  Widget _buildActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(child: const Text("Launch Map"), onPressed: () {
          MapsLauncher.launchCoordinates(restaurant.location.latitude, restaurant.location.longitude);
        }),
        TextButton(child: const Text("Launch Website"), onPressed: () {
          launch(restaurant.website);
        }),
      ]
    );
  }

  Widget _buildMapView() {
    return Expanded(
      child: GoogleMap(initialCameraPosition: CameraPosition(
        target: LatLng(restaurant.location.latitude, restaurant.location.longitude),
        zoom: 11.0
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMapView(),
        _buildActionRow(),
      ],
    );
  }
}
