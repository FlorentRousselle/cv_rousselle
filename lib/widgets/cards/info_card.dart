import 'package:cv_flutter/models/tables/air_table_data_info.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCardWidget extends StatelessWidget {
  final AirtableDataInfo dataInfo;
  final bool isWeb;

  const InfoCardWidget({
    Key? key,
    required this.dataInfo,
    required this.isWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launcher(dataInfo.link),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: builder(context),
        ),
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
                height: isWeb
                    ? isSmall
                        ? 150
                        : 225
                    : 125,
                width: isWeb
                    ? isSmall
                        ? 150
                        : 225
                    : 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.network(dataInfo.image),
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      dataInfo.link,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                    ),
                  ),
                  if (!isWeb)
                    const SizedBox(
                      height: 60,
                    ),
                  Text(
                    dataInfo.title,
                    style: isWeb
                        ? Theme.of(context).textTheme.headline1
                        : Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (isWeb)
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
        if (!isWeb)
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
          dataInfo.details,
        ),
      ),
    );
  }

  Future<bool> launcher(String link) {
    return launchUrl(
      Uri.parse(link),
    );
  }
}
