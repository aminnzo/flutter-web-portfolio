import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/education.dart';
import 'package:web_portfolio/utils/app_text_style.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    description: "شروع به کار و یادگیری ابزار های سئو، مدیریت و تولید محتوا در وبسایت ها و تحقیق درمورد روش های سئو محتوا و الگوریتم های گوگل",
    linkName: "Seo man - Faradata",
    period: "بهمن ۱۳۹۷ - تیر ۱۳۹۸",
  ),
  Education(
    description:
        "تغییر فعالیت به سئو اینستاگرام و تولید محتوا با ابزار های illustrator و after effects و..تحقیق در مورد رفتار های کاربران در اینستاگرام، کمپین ها و سوشال سیگنال",
    linkName: "Social Media - Faramaham",
    period: "تیر ۱۳۹۸ - مرداد ۱۳۹۹",
  ),
  Education(
    description:
        "تولید محتوای ویدئویی و تصویری، ساخت برنامه محتوایی و استراتژِی تعامل با کاربر ، راه اندازی کمپین های تبلیغاتی و مشارکت در سئو سایت مجموعه و استفاده از ابزارها",
    linkName: "digital marketing - Pakarto",
    period: " تیر 1400 - اردیبهشت 1401",
  ),
  Education(
    description:
        "تولید محتوا ، مدیر پروژه ، مشاوره کسب و کار در  دیجیتال مارکتینگ و شبکه های اجتماعی",
    linkName: "free lancer",
    period: "مرداد 1399 - الان",
  ),
];

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        alignment: Alignment.center,
        child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "همکاری های من",
                style: AppTextStyle.head.copyWith(
                  fontFamily: AppTextStyle.peydaFont,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Wrap(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 400.0),
                    child: Text(
                      "بازیکن تیم - یادگیری سریع - ایده پرداز",
                      style: AppTextStyle.standard.copyWith(
                        color: kCaptionColor,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: educationList
                          .map(
                            (education) => Container(
                              width: constraints.maxWidth / 2.0 - 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    education.period,
                                    style: AppTextStyle.head.copyWith(
                                      fontFamily: AppTextStyle.peydaFont,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        education.linkName,
                                        style: TextStyle(
                                          color: kDangerColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    education.description,
                                    maxLines: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.standard.copyWith(
                                      color: kCaptionColor,
                                      height: 1.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
