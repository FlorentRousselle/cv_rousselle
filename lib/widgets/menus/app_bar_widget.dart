import 'package:cv_flutter/notifiers/theme_notifier.dart';
import 'package:cv_flutter/widgets/menus/popup_menu_button_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final ThemeNotifier themeNotifier;

  const AppBarWidget({
    Key? key,
    required this.title,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: Theme.of(context).backgroundColor),
      ),
      iconTheme: Theme.of(context)
          .iconTheme.copyWith(color: Theme.of(context).backgroundColor),
      actions: [
        PopupMenuButtonWidget(themeNotifier: themeNotifier),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
