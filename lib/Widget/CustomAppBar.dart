import 'package:cv_flutter/Global.dart';
import 'package:cv_flutter/Widget/CustomPopupMenuButton.dart';
import 'package:cv_flutter/service/ThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


///
/// AppBar use in app
///
AppBar CustomAppBar(String title, bool iconVisible, BuildContext context) {
  ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

  return iconVisible
      ? AppBar(
          title: Text(title, style: Theme.of(context).textTheme.headline1),
          actions: [
            GestureDetector(
                child: SvgPicture.asset(FACEBOOK_SVG,
                    height: 25,
                    width: 25,
                    color: Theme.of(context).iconTheme.color),
                onTap: () =>
                    launch(FACEBOOK_LINK)),
            const SizedBox(width: 10),
            GestureDetector(
                child: SvgPicture.asset(LINKEDIN_SVG,
                    height: 25,
                    width: 25,
                    color: Theme.of(context).iconTheme.color),
                onTap: () => launch(
                    LINKEDIN_LINK)),
            const SizedBox(width: 10),
            CustomPopupMenuButton(context, themeNotifier),
            const SizedBox(width: 15)
          ],
        )
      : AppBar(
          centerTitle: true,
          title: Text(title, style: Theme.of(context).textTheme.headline1),
          actions: [
            CustomPopupMenuButton(context, themeNotifier),
              const SizedBox(width: 15)
            ]);
}
