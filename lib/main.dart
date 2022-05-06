import 'package:fancy_cursor/fancy_cursor.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme.apply(
      fontFamily: 'Vazir',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        canvasColor: kBackgroundColor,
        textTheme: getTextTheme(context),
        // textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: "4K"),
        ],
        background: Container(
          color: kBackgroundColor,
        ),
      ),
      home: FancyCursor(
        color: Colors.white,
        size: 4,
        trailSize: 40,
        trailColor: kPrimaryColor.withOpacity(0.3),
        trailDelay: Duration(milliseconds: 800),
        child: Home(),
      ),
    );
  }
}
