import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput();

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      return;
    }
    final staticMapUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );
    setState(() {
      _previewImageUrl = staticMapUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? const Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: const Text('Current location'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: const Text('Select on map'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            )
          ],
        )
      ],
    );
  }
}
