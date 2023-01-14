import 'package:cv_flutter/models/tables/air_table_data_skill_element.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillCardWidget extends StatelessWidget {
  final AirtableDataSkillElement dataSkill;
  final bool isWeb;

  const SkillCardWidget({
    Key? key,
    required this.dataSkill,
    required this.isWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3.0,
      child: Padding(
        padding: isWeb ? const EdgeInsets.all(10.0) : const EdgeInsets.all(6.0),
        child: builder(context),
      ),
    );
  }

  Widget builder(BuildContext context) {
    return SizedBox(
      height: isWeb ? 120 : 62,
      width: isWeb ? 320 : 200,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Container(
                  height: isWeb ? 100 : 55,
                  width: isWeb ? 100 : 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.network(dataSkill.image),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dataSkill.title,
                    style: isWeb
                        ? Theme.of(context).textTheme.headline1
                        : Theme.of(context).textTheme.headline2,
                  ),
                  noteWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noteWidget() {
    List<Widget> heartWidgets = <Widget>[];
    int maxNote = 5;
    for (var i = 1; i <= maxNote; i++) {
      if (dataSkill.note >= i) {
        heartWidgets.add(
          SvgPicture.asset(
            Global.heartFilledSvg,
            height: isWeb ? 25 : 15,
            width: isWeb ? 25 : 15,
          ),
        );
      } else {
        heartWidgets.add(
          SvgPicture.asset(
            Global.heartOutlinedSvg,
            height: isWeb ? 25 : 15,
            width: isWeb ? 25 : 15,
          ),
        );
      }
    }
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5.0,
      runSpacing: 5.0,
      children: heartWidgets,
    );
  }
}
