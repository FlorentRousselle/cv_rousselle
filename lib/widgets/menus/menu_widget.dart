import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/image_resources.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MenuWidget extends ConsumerWidget {
  const MenuWidget({super.key, this.mobileMenu = false});

  final bool mobileMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeNotifier homeNotifier = ref.watch(homeProvider);
    return Padding(
      padding:
          mobileMenu ? const EdgeInsets.all(20.0) : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: CustomGlassmorphismContainerWidget(
        width: mobileMenu ? double.infinity : 250,
        height: mobileMenu ? 72 : double.maxFinite,
        radius: 20,
        blur: 2,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: mobileMenu ? 0 : 20,
            vertical: mobileMenu ? 0 : 40,
          ),
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Wrap(
              direction: mobileMenu ? Axis.horizontal : Axis.vertical,
              alignment:
                  mobileMenu ? WrapAlignment.spaceEvenly : WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: mobileMenu ? 0 : 12.0,
              children: [
                if (!mobileMenu) ...[
                  Image.asset(ImageResources.picture, width: 160, height: 160),
                  Text(
                    "Florent Rousselle",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
                for (var item in homeNotifier.getMenuItems(mobileMenu)) item,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
