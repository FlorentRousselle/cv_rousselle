import 'package:cv_flutter/models/tables/air_table_data_education.dart';
import 'package:flutter/material.dart';

class EducationCardWidget extends StatelessWidget {
  final AirtableDataEducation dataEducation;
  final bool isWeb;

  const EducationCardWidget({
    Key? key,
    required this.dataEducation,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: isWeb
                ? 100
                : 75,
            width: isWeb
                ? 100
                : 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(dataEducation.image),
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
                dataEducation.diploma,
                style: isWeb
                    ? Theme.of(context).textTheme.headline1
                    : Theme.of(context).textTheme.headline2,
              ),
              if (!isWeb)
                const SizedBox(
                  height: 5.0,
                ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 25.0,
                runSpacing: 5.0,
                children: [
                  Text(
                    dataEducation.details,
                    style: isWeb
                        ? Theme.of(context).textTheme.headline3
                        : Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    dataEducation.date,
                    style: isWeb
                        ? Theme.of(context).textTheme.headline2
                        : Theme.of(context).textTheme.bodyText2!.copyWith(
                            color:
                                Theme.of(context).textTheme.headline1!.color),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "École: ${dataEducation.school}",
                style: isWeb
                    ? Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        )
                    : Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
