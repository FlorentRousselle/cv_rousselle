import 'package:cv_flutter/models/selector_item_model.dart';
import 'package:cv_flutter/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectorMenuItem extends StatelessWidget {
  final SelectorItemModel item;
  final void Function() onPressed;
  final bool isTextShow;
  final bool isSelected;

  static const Color bgColor = ColorResources.black;
  static const Color bgSelectedColor = ColorResources.blue;
  static const Color borderSelectedColor = ColorResources.white;
  static const Color textSelectedColor = ColorResources.white;
  static const Color textColor = ColorResources.blue;

  const SelectorMenuItem({
    Key? key,
    required this.onPressed,
    required this.item,
    this.isTextShow = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        width: isTextShow ? 200 : 40,
        decoration: BoxDecoration(
          color: isSelected ? bgSelectedColor : bgColor,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: isSelected ? borderSelectedColor : Colors.transparent,
            strokeAlign: StrokeAlign.outside,
            width: 3.0,
          ),
          boxShadow: isSelected ? selectedShadow() : unselectedShadow(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: Center(
                  child: SvgPicture.asset(item.iconLink,
                      color: isSelected ? textSelectedColor : textColor),
                ),
              ),
              if (isTextShow)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 56,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.name,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                color:
                                    isSelected ? textSelectedColor : textColor,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      onTap: onPressed,
    );
  }

  List<BoxShadow> selectedShadow() {
    return [
      const BoxShadow(
        color: ColorResources.shadow,
        offset: Offset(2, 4),
        spreadRadius: 3.0,
        blurRadius: 3.0,
      ),
    ];
  }

  List<BoxShadow> unselectedShadow() {
    return [
      const BoxShadow(
        color: bgColor,
        spreadRadius: 2,
      ),
      const BoxShadow(
        color: ColorResources.white,
        spreadRadius: -8.0,
        blurRadius: 15.0,
        offset: Offset(-2, -4),
      ),
    ];
  }
}
