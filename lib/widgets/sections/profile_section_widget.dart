import 'package:cv_flutter/models/profiles/profile_model.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/cards/profile_card_widget.dart';
import 'package:cv_flutter/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

class ProfileSectionWidget extends StatelessWidget {
  final List<ProfileModel> listProfile;

  const ProfileSectionWidget({super.key, required this.listProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SectionHeaderWidget(
          iconPath: IconResources.profile,
          text: "Profil",
        ),
        for (var profile in listProfile) ProfileCardWidget(profile: profile),
      ],
    );
  }
}
