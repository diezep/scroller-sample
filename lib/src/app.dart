import 'package:flutter/material.dart';
import 'package:travel_spaces/src/pages/places_page.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key key}) : super(key: key);
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return PlacesPage();
  }
}
