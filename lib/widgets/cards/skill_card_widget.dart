import 'package:cv_flutter/models/projects/project_model.dart';
import 'package:cv_flutter/models/skills/skill_model.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillCardWidget extends StatelessWidget {
  final SkillModel skill;

  const SkillCardWidget({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfFilledHeart = skill.rating;
    int numberOfEmptyHeart = 5 - numberOfFilledHeart;
    return CustomGlassmorphismContainerWidget(
      height: 100,
      child: Padding(
        padding: const EdgeInsetsGeometry.only(left: 20.0, right: 8.0),
        child: Row(
          spacing: 8.0,
          children: [
            Image.asset(skill.imageLink, height: 50, fit: BoxFit.fill),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.0,
                children: [
                  Text(
                    skill.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      height: 0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      ...generateHeartIcon(
                        context,
                        filledHeart: true,
                        numberOfHeart: numberOfFilledHeart,
                      ),
                      ...generateHeartIcon(
                        context,
                        filledHeart: false,
                        numberOfHeart: numberOfEmptyHeart,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<SvgPicture> generateHeartIcon(
    BuildContext context, {
    required bool filledHeart,
    required int numberOfHeart,
  }) {
    List<SvgPicture> listSvg = [];
    for (int i = 0; i < numberOfHeart; i++) {
      listSvg.add(
        SvgPicture.asset(
          filledHeart ? IconResources.heartFilled : IconResources.heart,
          width: 25,
          colorFilter: ColorFilter.mode(
            Theme.of(context).secondaryHeaderColor,
            BlendMode.srcIn,
          ),
        ),
      );
    }
    return listSvg;
  }
}
