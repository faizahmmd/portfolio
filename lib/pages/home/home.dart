import 'package:flutter/material.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/experience_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/sponsors.dart';
import 'package:web_portfolio/pages/home/components/testimonial_widget.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'components/ios_app_ad.dart';
import 'components/website_ad.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollDirection = Axis.vertical;

  AutoScrollController controller;
  List<List<int>> randomList;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Globals.scaffoldKey,
        endDrawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return headerItems[index].isButton
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kDangerColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 28.0),
                            child: TextButton(
                              onPressed: () async {
                                await scrollToIndex(headerItems[index].index);
                              },
                              child: Text(
                                headerItems[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : ListTile(
                          onTap: () async {
                            await scrollToIndex(headerItems[index].index);
                          },
                          title: Text(
                            headerItems[index].title,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: headerItems.length,
              ),
            ),
          ),
        ),
        body: ListView(
          scrollDirection: scrollDirection,
          controller: controller,
          children: [
            AutoScrollTag(
              key: ValueKey(0),
              controller: controller,
              index: 0,
              child: Container(
                child: Header(
                  newIndex: (value) async {
                    setState(() {
                      index = value;
                    });
                    await scrollToIndex(index);
                  },
                ),
              ),
            ),
            AutoScrollTag(
              key: ValueKey(1),
              controller: controller,
              index: 1,
              child: Carousel(),
            ),
            SizedBox(
              height: 20.0,
            ),
            AutoScrollTag(
              key: ValueKey(2),
              controller: controller,
              index: 2,
              child: CvSection(),
            ),
            // AutoScrollTag(
            //   key: ValueKey(3),
            //   controller: controller,
            //   index: 3,
            //   child: IosAppAd(),
            // ),
            // SizedBox(
            //   height: 70.0,
            // ),
            // AutoScrollTag(
            //   key: ValueKey(4),
            //   controller: controller,
            //   index: 4,
            //   child: WebsiteAd(),
            // ),
            AutoScrollTag(
              key: ValueKey(5),
              controller: controller,
              index: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: PortfolioStats(),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            AutoScrollTag(
              key: ValueKey(7),
              controller: controller,
              index: 7,
              child: EducationSection(),
            ),
            SizedBox(
              height: 50.0,
            ),
            AutoScrollTag(
              key: ValueKey(8),
              controller: controller,
              index: 8,
              child: SkillSection(),
            ),
            SizedBox(
              height: 50.0,
            ),
            AutoScrollTag(
              key: ValueKey(9),
              controller: controller,
              index: 9,
              child: ExperienceSection(),
            ),
            SizedBox(
              height: 10.0,
            ),
            AutoScrollTag(
              key: ValueKey(10),
              controller: controller,
              index: 10,
              child: Sponsors(),
            ),
            SizedBox(
              height: 50.0,
            ),
            AutoScrollTag(
              key: ValueKey(11),
              controller: controller,
              index: 11,
              child: TestimonialWidget(),
            ),
            AutoScrollTag(
              key: ValueKey(12),
              controller: controller,
              index: 12,
              child: Footer(),
            ),
          ],
        ));
  }

  Future scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
  }
}
