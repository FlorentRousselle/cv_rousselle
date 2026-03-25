import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.iconPath,
    required this.text,
  });

  final String iconPath;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          spacing: 8.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 28.0,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
