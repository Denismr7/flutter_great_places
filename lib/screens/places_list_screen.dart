import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatPlaces, child) => greatPlaces.items.length <= 0
            ? child!
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.items[i].image),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {},
                ),
              ),
        child: Center(
          child: const Text('No places yet, start adding some!'),
        ),
      ),
    );
  }
}
