import 'package:cv_flutter/models/profiles/profile_model.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/cards/profile_card_widget.dart';
import 'package:cv_flutter/widgets/cards/profile_name_and_photo_card_widget.dart';
import 'package:cv_flutter/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileSectionWidget extends StatelessWidget {
  final List<ProfileModel> listProfile;
  final bool showNameAndPhoto;

  const ProfileSectionWidget({
    super.key,
    required this.listProfile,
    required this.showNameAndPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
        return Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SectionHeaderWidget(
              iconPath: IconResources.profile,
              text: "Profil",
            ),
            if (showNameAndPhoto) const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: ProfileNameAndPhotoCardWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: StaggeredGrid.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children:
                    listProfile.map((ProfileModel profile) {
                      int tileSpan =
                          (profile.fillSpace && crossAxisCount > 1) ? 2 : 1;
                      return StaggeredGridTile.fit(
                        crossAxisCellCount: tileSpan,
                        child: ProfileCardWidget(profile: profile),
                      );
                    }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
