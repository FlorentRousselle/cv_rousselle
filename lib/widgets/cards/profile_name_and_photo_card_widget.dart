import 'package:cv_flutter/models/profiles/profile_info_model.dart';
import 'package:cv_flutter/models/profiles/profile_model.dart';
import 'package:cv_flutter/resources/image_resources.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileNameAndPhotoCardWidget extends StatelessWidget {
  const ProfileNameAndPhotoCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: CustomGlassmorphismContainerWidget(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 15.0,
            horizontal: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12.0,
            children: [
              Image.asset(ImageResources.picture, width: 80, height: 80),
              Flexible(
                child: Text(
                  "Florent Rousselle",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
