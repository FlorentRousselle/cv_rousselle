import 'package:cv_flutter/models/profiles/profile_info_model.dart';
import 'package:cv_flutter/models/profiles/profile_model.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCardWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileCardWidget({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: CustomGlassmorphismContainerWidget(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 15.0,
            horizontal: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12.0,
            children: [
              Center(
                child: Text(
                  profile.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              if (profile.hasDetail)
                Center(
                  child: Text(
                    profile.detail,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              Column(
                crossAxisAlignment:
                    profile.centerInfo
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                spacing: 8.0,
                children:
                    profile.listProfileInfo.map((ProfileInfoModel profileInfo) {
                      return Row(
                        spacing: 8.0,
                        mainAxisAlignment: profile.centerInfo
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          // TODO(florent): Replace with .network for Firebase
                          if (profileInfo.hasImage)
                            Image.asset(profileInfo.imageLink, width: 40),
                          Flexible(
                            child: Column(
                              spacing: 2.0,
                              crossAxisAlignment:
                                  profile.centerInfo
                                      ? CrossAxisAlignment.center
                                      : CrossAxisAlignment.start,
                              children: [
                                if (profileInfo.hasTitle)
                                  Text(
                                    profileInfo.title,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium?.copyWith(
                                      color:
                                          Theme.of(
                                            context,
                                          ).secondaryHeaderColor,
                                      height: 1,
                                    ),
                                  ),
                                RichText(
                                  text: TextSpan(
                                    text: profileInfo.text,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      decoration:
                                          profileInfo.hasLink
                                              ? TextDecoration.underline
                                              : null,
                                    ),
                                    recognizer:
                                        profileInfo.hasLink
                                            ? (TapGestureRecognizer()
                                              ..onTap =
                                                  () => launchUrl(
                                                    Uri.parse(
                                                      profileInfo.urlLink,
                                                    ),
                                                  ))
                                            : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
