import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_spaces/src/models/place_model.dart';
import 'package:travel_spaces/src/models/placecardsettings_model.dart';
import 'package:travel_spaces/src/widgets/place_card.dart';

class PlacesPageView extends StatefulWidget {
  PlacesPageView({Key key, this.places, this.bottomNavigationBar})
      : super(key: key);
  List<Place> places;
  Widget bottomNavigationBar = Container();
  @override
  _PlacesPageViewState createState() => _PlacesPageViewState();
}

class _PlacesPageViewState extends State<PlacesPageView> {
  Size size;
  int selectedCard = 0;

  PageController pageController;
  double pageOffset = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    setState(() {
      pageOffset = pageController.page % 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ClipRRect(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutQuart,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: Image.network(
                widget.places[selectedCard]?.image,
                fit: BoxFit.cover,
                color: Color.fromRGBO(255, 255, 255, 1 - pageOffset / 1.5),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              child: Image.network(
                widget
                    .places[widget.places.length - 1 == selectedCard
                        ? selectedCard
                        : selectedCard + 1]
                    ?.image,
                fit: BoxFit.cover,
                color: Color.fromRGBO(255, 255, 255, .5 + pageOffset / 2),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            BackdropFilter(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 24, top: 48),
                                child: BrandLogo()),
                            // Container(
                            //     width: 200,
                            //     height: 40,
                            //     child: DropdownButton(
                            //         isExpanded: false,
                            //         items: [
                            //           DropdownMenuItem(child: Text('Most popular'))
                            //         ],
                            //         onChanged: (_) {}))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.2, 0.3),
                    child: Container(
                      // transform: Transform.scale(scale:0.3).transform,
                      height: size.height * .7,
                      child: PageView.builder(
                          controller: pageController,
                          onPageChanged: (i) =>
                              setState(() => selectedCard = i),
                          itemCount: widget.places.length,
                          itemBuilder: (context, i) => PlaceCard(
                                margin: EdgeInsets.only(left: 64),
                                width: size.width,
                                height: size.height * .8,
                                place: widget.places[i],
                              )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: widget.bottomNavigationBar,
                  )
                ],
              ),
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandLogo extends StatelessWidget {
  Color kDotColor = Colors.pink[300];
  BrandLogo({this.themeLogo = ThemeLogo.LIGHT});
  ThemeLogo themeLogo;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 19,
        letterSpacing: 1.7,
        color: ThemeLogo == ThemeLogo.DARK ? Colors.black : Colors.white);

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Travel', style: textStyle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.down,
            children: [
              Text('Places', style: textStyle),
              Container(
                width: 5,
                height: 5,
                transform: Transform.translate(offset: Offset(0, -3)).transform,
                margin: EdgeInsets.only(left: 2),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kDotColor),
              )
            ],
          )
        ],
      ),
    );
  }
}

enum ThemeLogo { LIGHT, DARK }
