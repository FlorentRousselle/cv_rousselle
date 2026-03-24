import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/menus/left_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
      body: Stack(
        children: [
          // background
          SvgPicture.asset(
            IconResources.background,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),

          // content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 20.0,
                children: [
                  LeftMenuWidget(
                    context: context,
                    homeNotifier: homeNotifier,
                  ),
                  Expanded(
                    child: Container(color: Colors.red),

                    // ScrollablePositionedList.separated(
                    //   itemScrollController: homeNotifier.scrollController,
                    //   itemCount: 5,
                    //   itemBuilder: (context, index) {
                    //     return homeNotifier.getScreen(index, homeNotifier, true);
                    //   },
                    //   separatorBuilder: (context, index) => Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    //     child: Divider(
                    //       color: Theme.of(context).appBarTheme.backgroundColor,
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileHomeScreenBuilder(HomeNotifier homeNotifier) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(height: 120, color: Colors.red),
      ),
      // bottomNavigationBar: BottomBarWidget(homeNotifier: homeNotifier),
    );
  }
}
