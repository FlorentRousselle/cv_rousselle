import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/resources/image_resources.dart';
import 'package:cv_flutter/widgets/menus/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key, this.mobileMenu = false}) : super(key: key);

  final bool mobileMenu;

  List<Widget> getMenuItems(bool smallFormat) {
    return <Widget>[
      MenuItemWidget(
        text: "Profil",
        iconPath: IconResources.profile,
        isSelected: true,
        isMobileFormat: smallFormat,
        onPressed: () {},
      ),
      MenuItemWidget(
        text: "Expériences",
        iconPath: IconResources.experience,
        isSelected: false,
        isMobileFormat: smallFormat,
        onPressed: () {},
      ),
      MenuItemWidget(
        text: "Mes projets",
        iconPath: IconResources.project,
        isSelected: false,
        isMobileFormat: smallFormat,
        onPressed: () {},
      ),
      MenuItemWidget(
        text: "Compétences",
        iconPath: IconResources.skill,
        isSelected: false,
        isMobileFormat: smallFormat,
        onPressed: () {},
      ),
      MenuItemWidget(
        text: "Formations",
        iconPath: IconResources.formation,
        isSelected: false,
        isMobileFormat: smallFormat,
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          mobileMenu ? const EdgeInsets.all(20.0) : const EdgeInsets.all(0.0),
      child: GlassmorphicContainer(
        width: mobileMenu ? double.infinity : 250,
        height: mobileMenu ? 72 : double.maxFinite,
        borderRadius: 20,
        blur: 2,
        alignment: Alignment.topCenter,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.35),
            Colors.white.withValues(alpha: 0.3),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.5),
            Colors.white.withValues(alpha: 0.1),
          ],
        ),
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
                for (var item in getMenuItems(mobileMenu)) item,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
