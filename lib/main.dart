import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_spaces/src/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.light()
          .copyWith(textTheme: GoogleFonts.quicksandTextTheme()),
      initialRoute: AppScreen.routeName,
      routes: {AppScreen.routeName: (context) => AppScreen()},
    );
  }
}
