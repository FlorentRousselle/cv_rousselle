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
      borderRadius: 20,
      blur: 20,
      padding: EdgeInsets.all(40),
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: [0.1, 1],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      width: 200,
      height: 200,
      child: Text(profile.title),
    );
  }

  Future<bool> launcher(String url) {
    return launchUrl(Uri.parse(url));
  }
}
