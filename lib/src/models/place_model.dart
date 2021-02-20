import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_spaces/src/models/placecardsettings_model.dart';

class Place {
  final String name;
  final String description;
  final String image;
  final int nReviews;
  final int score;

  final PlaceCardSettings placeCardSettings;

  Place(
      {this.name,
      this.description,
      this.image,
      this.nReviews,
      this.score,
      this.placeCardSettings = const PlaceCardSettings(
          textColor: Colors.white,
          buttonColor: Colors.black,
          backgroundColor: Colors.white)});
}
