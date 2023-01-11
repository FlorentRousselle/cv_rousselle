import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCardWidget extends StatelessWidget {
  final AirtableDataExperience dataExperience;
  final bool isWeb;

  const ExperienceCardWidget({
    Key? key,
    required this.dataExperience,
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
        padding: const EdgeInsets.all(10.0),
        child: isWeb ? buildWeb(context) : buildMobile(context),
      ),
    );
  }

  Widget buildWeb(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(dataExperience.image),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              dataExperience.title,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  dataExperience.function,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  dataExperience.period,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              dataExperience.function,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration : BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  child: Text(
                    dataExperience.details,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.network(
              dataExperience.image,
              width: isWeb ? 60 : 30,
              color: Theme.of(context).textTheme.headline1!.color,
            ),
            SizedBox(
              width: isWeb ? 20 : 10,
            ),
            Text(
              dataExperience.title,
              style: isWeb
                  ? Theme.of(context).textTheme.headline1
                  : Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: isWeb ? 45.0 : 20),
          child: Text(
            dataExperience.details,
            style: isWeb
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
