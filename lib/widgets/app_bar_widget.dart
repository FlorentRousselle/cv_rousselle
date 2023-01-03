import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';


///
/// AppBar use in app
///
AppBar CustomAppBar(String title, bool iconVisible, BuildContext context) {
  return iconVisible
      ? AppBar(
          title: Text(title, style: Theme.of(context).textTheme.headline1),
          actions: [
            GestureDetector(
                child: SvgPicture.asset(facebookSvg,
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
