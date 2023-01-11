import 'package:cv_flutter/notifiers/theme_notifier.dart';
import 'package:cv_flutter/widgets/menus/popup_menu_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String iconLink;
  final ThemeNotifier themeNotifier;

  const AppBarWidget({
    Key? key,
    required this.title,
    required this.iconLink,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          iconLink,
          color: Theme.of(context).backgroundColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: Theme.of(context).backgroundColor),
      ),
      iconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: Theme.of(context).backgroundColor),
      actions: [
        PopupMenuButtonWidget(themeNotifier: themeNotifier),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
