import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/stat.dart';
import 'package:web_portfolio/utils/app_text_style.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Stat> stats = [
  Stat(count: "6782", text: "تاثیر پذیری"),
  Stat(count: "3h", text: "بعد از انتشار"),
  Stat(count: "96%", text: "فالور نبودن"),
  Stat(count: "442", text: "اکسپلور"),
];

class PortfolioStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint) {
              return Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: stats.map((stat) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    // Just use the helper here really
                    width: ScreenHelper.isMobile(context)
                        ? constraint.maxWidth / 2.0 - 20
                        : (constraint.maxWidth / 4.0 - 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stat.count,
                          style: AppTextStyle.head.copyWith(
                            fontFamily: AppTextStyle.peydaFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 32.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          stat.text,
                          style: AppTextStyle.standard.copyWith(
                            color: kCaptionColor,
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
