import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/app_text_style.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<String> tools = [
  "Behance",
  "Envato",
  "Google",
  "Material",
  "Freepik",
  "ColorHunt",
];

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: ResponsiveWrapper(
      minWidth: width,
      maxWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Wrap(
            runSpacing: 50.0,
            spacing: 50.0,
            children: tools
                .map(
                  (text) => Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      text,
                      style: AppTextStyle.head.copyWith(
                        color: kCaptionColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    ),
  );
}
