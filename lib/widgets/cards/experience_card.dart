import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:flutter/material.dart';

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
        child: builder(context),
      ),
    );
  }

  Widget builder(BuildContext context) {
    bool isSmall = MediaQuery.of(context).size.width < 1000;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: isSmall ? 100 : 200,
                width: isSmall ? 100 : 200,
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
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    dataExperience.title,
                    style: isWeb
                        ? Theme.of(context).textTheme.headline1
                        : Theme.of(context).textTheme.headline2,
                  ),
                  if(!isWeb)
                  const SizedBox(
                    height: 5.0,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 25.0,
                    runSpacing: 5.0,
                    children: [
                      Text(
                        dataExperience.contract,
                        style: isWeb
                            ? Theme.of(context).textTheme.headline3
                            : Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        dataExperience.period,
                        style: isWeb
                            ? Theme.of(context).textTheme.headline2
                            : Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    dataExperience.function,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  if (!isSmall)
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        boxDetail(context),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        if (isSmall)
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              boxDetail(context),
            ],
          ),
      ],
    );
  }

  Container boxDetail(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dataExperience.details,
        ),
      ),
    );
  }
}
