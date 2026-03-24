import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    required this.iconPath,
    required this.isSelected,
    required this.onPressed,
    this.text = "",
    super.key,
  });

  final String iconPath;

  final String text;

  final bool isSelected;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 60,
        child: Row(
          spacing: 8.0,
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
      ),
    );
  }
}
