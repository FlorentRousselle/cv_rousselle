import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/menus/menu_widget.dart';
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
  @override
  void initState() {
    super.initState();
    final HomeNotifier homeNotifier = ref.read(homeProvider);
    homeNotifier.initListener();
  }

  /// build home screen
  @override
  Widget build(BuildContext context) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return webHomeScreenBuilder(homeNotifier);
        } else {
          return mobileHomeScreenBuilder(homeNotifier);
        }
      },
    );
  }

  Widget webHomeScreenBuilder(HomeNotifier homeNotifier) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            // background
            Positioned.fill(
              child: SvgPicture.asset(
                IconResources.background,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),

            // content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 20.0,
                  children: [
                    const MenuWidget(mobileMenu: false),
                    // NavigationRail(
                    //   selectedIndex: homeNotifier.selectedIndexItem,
                    //   onDestinationSelected: homeNotifier.scrollToIndex,
                    //   labelType: NavigationRailLabelType.all,
                    //   destinations:
                    //       sections
                    //           .map(
                    //             (name) => NavigationRailDestination(
                    //               icon: Icon(Icons.circle_outlined),
                    //               selectedIcon: Icon(Icons.circle),
                    //               label: Text(name),
                    //             ),
                    //           )
                    //           .toList(),
                    // ),
                    Expanded(
                      child: ScrollablePositionedList.separated(
                        itemScrollController: homeNotifier.itemScrollController,
                        itemCount: homeNotifier.getMenuItems(false).length,
                        itemPositionsListener:
                            homeNotifier.itemPositionsListener,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 800,
                            color:
                                index.isEven
                                    ? Colors.grey[100]?.withAlpha(100)
                                    : Colors.white.withAlpha(100),
                            child: Center(
                              child: Text(
                                "INDEX" + index.toString(),
                                style: Theme.of(context).textTheme.displayLarge
                                    ?.copyWith(color: Colors.red),
                              ),
                            ),
                          );
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mobileHomeScreenBuilder(HomeNotifier homeNotifier) {
    return Scaffold(
      body: Expanded(
        child: ScrollablePositionedList.separated(
          itemScrollController: homeNotifier.itemScrollController,
          itemCount: homeNotifier.getMenuItems(true).length,
          itemBuilder: (context, index) {
            return Container(
              height: 800,
              color: index.isEven ? Colors.grey[100] : Colors.white,
              child: Center(
                child: Text(
                  "INDEX" + index.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            );
          },
          separatorBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Divider(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
              ),
        ),
      ),
      bottomNavigationBar: const MenuWidget(mobileMenu: true),
    );
  }
}
