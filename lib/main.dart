import 'package:flutter/material.dart';
import 'package:portfolio_personal/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';


import 'home_view.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio Paolo',
      theme: _kPortfolioTheme,
      home: HomeView()
    );
  }
}

final ThemeData _kPortfolioTheme = _buildPortfolioTheme();

ThemeData _buildPortfolioTheme() {
  final ThemeData base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kPortfolioBlack900,
      secondary: kPortfolioBlack100,
      error: kPortfolioRed
    ),
    textTheme: _buildPortfolioTextTheme(base.textTheme),
    /* inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          /* color: kShrinePurple, */
          color: kShrineBrown900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        /* color: kShrinePurple, */
        color: kShrineBrown900,
      ),
    ), */
  );
}

TextTheme _buildPortfolioTextTheme(TextTheme base) {
  return base.copyWith(
    //headline5 => headlineSmall
    headlineSmall: GoogleFonts.baiJamjuree().copyWith(
      fontWeight: FontWeight.w500,
    ),
    //headline6 => titleLArge
    titleLarge: GoogleFonts.baiJamjuree().copyWith(
      fontSize: 18.0,
    ),
    //caption => bodySmall
    bodySmall: GoogleFonts.baiJamjuree().copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    //bodyText1 => bodyLarge
    bodyLarge: GoogleFonts.baiJamjuree().copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    displayColor: kPortfolioWhite100,
    bodyColor: kPortfolioWhite900
  );
}