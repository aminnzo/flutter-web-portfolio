import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(78, 129, 238, 1);
const Color kBackgroundColor = Color.fromRGBO(0, 0, 51, 1);
const Color kDangerColor = Color.fromRGBO(201, 81, 232, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
