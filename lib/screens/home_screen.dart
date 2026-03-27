import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/menus/menu_widget.dart';
import 'package:cv_flutter/widgets/sections/experience_section_widget.dart';
import 'package:cv_flutter/widgets/sections/profile_section_widget.dart';
import 'package:cv_flutter/widgets/sections/project_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Widget> sectionWidgets() {
    final HomeNotifier homeNotifier = ref.read(homeProvider);
    return [
      ProfileSectionWidget(listProfile: homeNotifier.listProfile),
      ExperienceSectionWidget(listExperience: homeNotifier.listExperience),
      ProjectSectionWidget(listProject: homeNotifier.listProject),
      ProfileSectionWidget(listProfile: []),
      ProfileSectionWidget(listProfile: []),
    ];
  }

  @override
  void initState() {
    super.initState();
    final HomeNotifier homeNotifier = ref.read(homeProvider);
    homeNotifier.initListener();
    homeNotifier.loadData();
  }

  /// build home screen
  @override
  Widget build(BuildContext context) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _homeScreenBuilder(
          homeNotifier,
          isMobile: constraints.maxWidth < 800,
        );
      },
    );
  }

  Widget _homeScreenBuilder(
    HomeNotifier homeNotifier, {
    bool isMobile = false,
  }) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: isMobile ? const MenuWidget(mobileMenu: true) : null,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            // background
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Color(0xffC3D9E9), Color(0xff97BDD8)],
                    center: Alignment.center,
                    radius: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  IconResources.background,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // content
            Positioned.fill(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 20.0,
                children: [
                  if (!isMobile)
                    const MenuWidget(mobileMenu: false),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 25,
                      ),
                      child: ScrollablePositionedList.separated(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                          bottom: 150.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemScrollController: homeNotifier.itemScrollController,
                        itemCount: homeNotifier.getMenuItems(false).length,
                        itemPositionsListener:
                            homeNotifier.itemPositionsListener,
                        itemBuilder: (context, index) {
                          return sectionWidgets()[index];
                        },
                        separatorBuilder:
                            (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 100.0,
                              ),
                              child: Divider(
                                color:
                                    Theme.of(
                                      context,
                                    ).appBarTheme.backgroundColor,
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
