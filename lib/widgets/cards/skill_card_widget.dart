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
    return IntrinsicHeight(
      child: CustomGlassmorphismContainerWidget(
        width: 250.0,
        child: Padding(
          padding: const EdgeInsetsGeometry.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8.0,
            children: [
              Image.asset(skill.imageLink, height: 50, fit: BoxFit.fitHeight),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      skill.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
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
                  ),
                ],
              ),
            ],
          ),
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
