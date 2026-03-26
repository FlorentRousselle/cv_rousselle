import 'package:cv_flutter/models/profiles/info_profile_model.dart';
import 'package:cv_flutter/models/profiles/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCardWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileCardWidget({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: double.infinity,
      height: double.maxFinite,
      borderRadius: 12,
      blur: 4,
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
        padding: EdgeInsetsGeometry.symmetric(vertical: 15.0, horizontal: 30.0),
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
                  profile.listInfoProfile.map((InfoProfileModel infoProfile) {
                    return Column(
                      spacing: 2.0,
                      crossAxisAlignment:
                          profile.centerInfo
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                      children: [
                        if (infoProfile.hasTitle)
                          Text(
                            infoProfile.title,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).secondaryHeaderColor,
                              height: 1,
                            ),
                          ),
                        Text(
                          infoProfile.text,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> launcher(String url) {
    return launchUrl(Uri.parse(url));
  }
}
