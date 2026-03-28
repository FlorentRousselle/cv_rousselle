import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    required this.iconPath,
    required this.onPressed,
    this.isSelected = false,
    this.isMobileFormat = false,
    this.text = "",
    super.key,
  });

  final String iconPath;

  final String text;

  final bool isSelected;

  final bool isMobileFormat;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        height: isMobileFormat ? 52 : 60,
        width: isMobileFormat ? 52 : 160,
        child: Row(
          spacing: isMobileFormat ? 0.0 : 8.0,
          mainAxisAlignment: isMobileFormat ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 28.0,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).textTheme.titleSmall!.color!,
                BlendMode.srcIn,
              ),
            ),
            if (!isMobileFormat)
              Text(
                text,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color:
                      isSelected
                          ? Theme.of(context).scaffoldBackgroundColor
                          : Theme.of(context).textTheme.titleSmall!.color!,
                ),
              ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        padding: isMobileFormat ? EdgeInsets.all(0.0) : null,
      ),
    );
  }
}
