import 'package:cv_flutter/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Chargement...",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 30,
            ),
            LoadingAnimationWidget.flickr(
              leftDotColor: ColorResources.blueDark,
              rightDotColor: ColorResources.blueLight,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
