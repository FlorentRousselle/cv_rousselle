import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// Menu to add in AppBar
/// show a Menu with clickable item
///
/*
PopupMenuButton<int> CustomPopupMenuButton(
    BuildContext context) {
  return PopupMenuButton(
    icon: Icon(Icons.menu,
        color: Theme.of(context)
            .iconTheme
            .color), //don't specify icon if you want 3 dot menu
    elevation: 0,
    itemBuilder: (context) => [
      PopupMenuItem<int>(
        value: 1,
        child: Text(
          "Changer le thème",
          style: Theme.of(context).textTheme.button,
        ),
      ),
      kIsWeb
          ? PopupMenuItem<int>(
              value: 2,
              child: Text(
                "Télécharger l'application Android",
                style: Theme.of(context).textTheme.button,
              ),
            )
          : PopupMenuItem<int>(
              value: 3,
              child: Text(
                "Voir sur le web",
                style: Theme.of(context).textTheme.button,
              ),
            )
    ],
    onSelected: (int value) => {
      if (value == 1)
        themeNotifier.swapTheme()
      else if (value == 2)
        launch("https://drive.google.com/file/d/1D7MQrFmwZEV4gBJNVrf4RdRCfnlYVXRD/view?usp=sharing")
      else if (value == 3)
        launch("https://cvrousselle.web.app")
    },
  );
}
*/