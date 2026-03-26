import 'package:cv_flutter/models/profiles/profile_model.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/cards/profile_card_widget.dart';
import 'package:cv_flutter/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        MasonryGridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
          ),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: listProfile.length,
          itemBuilder: (context, index) {
            final ProfileModel profileItem = listProfile[index];
            return ProfileCardWidget(profile: profileItem);
          },
        ),
      ],
    );
  }
}
