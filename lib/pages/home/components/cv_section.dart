import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/design_process.dart';
import 'package:web_portfolio/utils/app_text_style.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "تولید محتوا",
    imagePath: "assets/content-make.png",
    subtitle:
        "بعد از آنالیز های اولیه پیج و پیدا کردن دایره هدف شروع به تولید محتوای وایرال تصویری میشود. این محتوا در زمانبندی های تعیین شده بارگذاری میشود.",
  ),
  DesignProcess(
    title: "استراتژی",
    imagePath: "assets/strategy.png",
    subtitle:
        "اینستاگرام با هر نوع کسب کار به شیوه های متفاوتی عمل میکند. استراتژی ها در بازه زمانی های مختلفی تکمیل و بهتر میشن.",
  ),
  DesignProcess(
    title: "کمپین تبلیغاتی و تعامل",
    imagePath: "assets/advertize.png",
    subtitle:
        "دایره رقبا جمع آوری میشه و با استفاده از ابزار ها اینسایت کلی صفحه براورد و با در نظر گرفتن میزان بوجه وارد کمپین میشه.",
  ),
  DesignProcess(
    title: "آنالیز عملکرد",
    imagePath: "assets/analyze.png",
    subtitle:
        "ابزارهای زیادی وجود دارن که آنالیز عملکرد پیج رو با فیلترها مورد برسی قرار میدن .اینجا بطور کلی مشخص میشه روند پیج مثبت است یا باید تغیر روی استراتژِی محتوا داد.",
  ),
];

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _topCV(),
          const SizedBox(height: 50.0),
          _bottomItems(context),
        ],
      ),
    );
  }

  Widget _topCV() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "BETTER STRATEGY,\nBETTER INTERACTIONS",
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1.8,
            fontSize: 18.0,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: kDangerColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: Text(
                    "دانلود رزومه",
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
    );
  }

  Widget _bottomItems(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: LayoutBuilder(
          builder: (_context, constraints) {
            // return Wrap(
            //   children: List.generate(designProcesses.length, (index) => _itemBox(index)),
            // );
            return Container(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: ScreenHelper(
                desktop: _buildItems(kDesktopMaxWidth),
                tablet: _buildItems(kTabletMaxWidth),
                mobile: _buildItems(getMobileMaxWidth(context)),
              ),
            );
            // return ResponsiveGridView.builder(
            //   padding: EdgeInsets.all(0.0),
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   alignment: Alignment.topCenter,
            //   gridDelegate: ResponsiveGridDelegate(
            //     mainAxisSpacing: 20.0,
            //     crossAxisSpacing: 20.0,
            //     maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
            //         ScreenHelper.isMobile(context)
            //         ? constraints.maxWidth / 2.0
            //         : 250.0,
            //     // Hack to adjust child height
            //     childAspectRatio: ScreenHelper.isDesktop(context)
            //         ? 1
            //         : MediaQuery.of(context).size.aspectRatio * 1.5,
            //   ),
            //   itemBuilder: (BuildContext context, int index) {
            //     return _itemBox(index);
            //   },
            //   itemCount: designProcesses.length,
            // );
          },
        ),
      ),
    );
  }

  Widget _itemBox2(DesignProcess item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              item.imagePath,
              width: 70.0,
            ),
            SizedBox(width: 15.0),
            Text(
              item.title,
              style: AppTextStyle.large.copyWith(
                fontFamily: AppTextStyle.peydaFont,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          item.subtitle,
          style: AppTextStyle.small.copyWith(
            color: kCaptionColor,
            height: 1.5,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget _buildItems(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            spacing: 50,
            children: designProcesses
                .map(
                  (item) => Container(
                    height: 180,
                    child: _itemBox2(item),
                    constraints: BoxConstraints(maxWidth: 300, minWidth: 250),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
