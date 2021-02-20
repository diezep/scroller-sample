import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_spaces/src/models/place_model.dart';
import 'package:travel_spaces/src/models/placecardsettings_model.dart';
import 'package:travel_spaces/src/widgets/place_pageview.dart';

class PlacesPage extends StatefulWidget {
  PlacesPage(
      {Key key,
      this.selectedIconColor = Colors.white,
      this.unselectedIconColor = Colors.white})
      : super(key: key);
  Color selectedIconColor = Colors.white;
  Color unselectedIconColor = Colors.white;

  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  List<Place> places = [];

  loadPlaces() async {
    final String jsonPlaces = await rootBundle.loadString('assets/places.json');
    List<Map<String, dynamic>> _places =
        List<Map<String, dynamic>>.from(json.decode(jsonPlaces)['places']);

    setState(() {
      places.add(
        Place(
            name: _places[0]['name'],
            description: _places[0]['description'],
            image: _places[0]['image'],
            nReviews: _places[0]['reviews'],
            score: _places[0]['score'],
            placeCardSettings: PlaceCardSettings(
                textColor: Colors.white,
                backgroundColor: Color(0xFF632D1C),
                buttonColor: Color(0xFF68ADD6))),
      );
      places.add(
        Place(
            name: _places[1]['name'],
            description: _places[1]['description'],
            image: _places[1]['image'],
            nReviews: _places[1]['reviews'],
            score: _places[1]['score'],
            placeCardSettings: PlaceCardSettings(
                textColor: Colors.white,
                backgroundColor: Color(0xFF632D1C),
                buttonColor: Color(0xFF3B89D5))),
      );
    });
  }

  @override
  void initState() {
    loadPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacesPageView(
        places: places,
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: widget.selectedIconColor,
              unselectedItemColor: widget.unselectedIconColor.withOpacity(0.6),
              items: [
                BottomNavigationBarItem(
                    title: Text('Places'), icon: Icon(Icons.terrain)),
                BottomNavigationBarItem(
                    title: Text('Search'), icon: Icon(Icons.search)),
                BottomNavigationBarItem(
                    title: Text('Notifications'),
                    icon: Icon(Icons.notifications_none)),
                BottomNavigationBarItem(
                    title: Text('Profile'), icon: Icon(Icons.person_outline)),
              ]),
        ),
      ),
    );
  }
}
