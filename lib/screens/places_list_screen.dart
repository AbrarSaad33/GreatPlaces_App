import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: Center(
            child: Text('Got no places yet,start adding some!'),
          ),
          builder: (ctx, greatPlace, ch) =>greatPlace.items.length<=0 ? ch!
           :ListView.builder(
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(greatPlace.items[i].image),
              ),
              title: Text(greatPlace.items[i].title),
              onTap: (){},
            ),
            itemCount: greatPlace.items.length,
          ),
        ));
  }
}
