import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/skill.dart';
import 'package:web_portfolio/utils/app_text_style.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "illustrator",
    percentage: 90,
  ),
  Skill(
    skill: "photoshop",
    percentage: 70,
  ),
  Skill(
    skill: "after effect",
    percentage: 40,
  ),
  Skill(
    skill: "google analytics",
    percentage: 40,
  ),
  Skill(
    skill: "KW finder",
    percentage: 80,
  ),
  Skill(
    skill: "coco",
    percentage: 100,
  ),
  Skill(
    skill: "fl studio",
    percentage: 40,
  ),
];

class SkillSection extends StatelessWidget {
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
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    ScreenHelper.isMobile(context) ? "assets/hand-2.png" : "assets/hand-1.png",
                    height: ScreenHelper.isMobile(context)
                        ? MediaQuery.of(context).size.width * .8
                        : MediaQuery.of(context).size.height * .7,
                  ),
                ),
                ScreenHelper.isMobile(context)
                    ? const SizedBox(height: 40) : const SizedBox(width: 50),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "مهارت در ابزارها",
                        style: AppTextStyle.head.copyWith(
                          fontFamily: AppTextStyle.peydaFont,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "” ابزارها صرفا فقط ابزار نیستند ، آنها مسیر رو هموار میکنند ”",
                        style: AppTextStyle.head.copyWith(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        child: Text(skill.skill, style: AppTextStyle.button,),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              kDangerColor,
                                              kPrimaryColor,
                                            ],
                                            begin: const FractionalOffset(0.0, 0.0),
                                            end: const FractionalOffset(1.0, 0.0),
                                            stops: [0.0, 1.0],
                                            tileMode: TileMode.clamp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
