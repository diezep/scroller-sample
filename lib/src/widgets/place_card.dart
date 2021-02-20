import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_spaces/src/models/place_model.dart';

class PlaceCard extends StatelessWidget {
  PlaceCard(
      {this.place, this.width, this.height, this.margin = EdgeInsets.zero});

  Place place;
  Size size;
  double width, height;
  EdgeInsets margin;

  static const double borderRadius = 24;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
        ),

        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.network(place.image).image,
                          fit: BoxFit.fitWidth),
                    ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: width,
                  margin: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 70,
                            color: Colors.black45,
                            spreadRadius: 1,
                            offset: Offset(-10, 0))
                      ],
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(15))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: TextStyle(
                            color: place.placeCardSettings.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 1.15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: place.description.substring(0, 110) + "...",
                              style: TextStyle(
                                color: place.placeCardSettings.textColor
                                    .withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              // TODO: Finalize this.
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('BURST!'))),
                      // TODO: onPressed to show info.
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(borderRadius),
                                  bottomLeft: Radius.circular(borderRadius),
                                  bottomRight: Radius.circular(borderRadius))),
                          onPressed: () => print('BURST!'),
                          color: place.placeCardSettings.buttonColor,
                          child: Text(
                            'Read more',
                            style: TextStyle(
                                color: place.placeCardSettings.textColor),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
