import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final Uri _svUrl = Uri.parse('https://s6.uupload.ir/files/certificate-1_9ya3.png');

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

  Widget _buildUi(double width) {
    return Center(
      child: ResponsiveWrapper(
        minWidth: width,
        maxWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topCertification(),
            const SizedBox(height: 60),
            LayoutBuilder(
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
          ],
        ),
      ),
    );
  }

  Widget _topCertification() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "THE FUNDAMENTALS\nOF DIGITAL MARKETING",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.8,
              fontSize: 18.0,
            ),
          ),
          GestureDetector(
            onTap: () => _launchCertUrl(),
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Text(
                      "Certificate",
                      style: AppTextStyle.standard.copyWith(
                        fontFamily: AppTextStyle.peydaFont,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void _launchCertUrl() async {
    if (!await launchUrl(_svUrl)) throw 'Could not launch $_svUrl';
  }

}
