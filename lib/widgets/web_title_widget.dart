import 'package:cv_flutter/resources/color_resources.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebTitleWidget extends StatelessWidget {
  final String title;
  final String iconLink;
  final double width;

  const WebTitleWidget({
    Key? key,
    this.title = "",
    this.iconLink = Global.profilSvg,
    this.width = 275,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.elliptical(10, 15),
                  bottomLeft: Radius.elliptical(10, 15),
                  bottomRight: Radius.elliptical(100, 10),
                  topRight: Radius.elliptical(100, 10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    ColorResources.blue,
                    ColorResources.blue.withOpacity(0.6),
                    ColorResources.blue.withOpacity(0.3),
                    ColorResources.blue.withOpacity(0.1),
                    ColorResources.blue.withOpacity(0),
                  ],
                ),
              ),
            ),
            left: 0,
            top: 6,
            bottom: 6,
            right: 0,
          ),
          Positioned(
            child: Center(
              child: SvgPicture.asset(
                iconLink,
                height: 40,
                color: Theme.of(context).textTheme.bodyText2!.color,
              ),
            ),
            left: 5,
            top: 0,
            bottom: 0,
          ),
          // Positioned(
          //   child: Container(
          //     height: 60,
          //     width: 60,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8.0),
          //       color: ColorResources.blue,
          //     ),
          //     child: Center(
          //       child: SvgPicture.asset(
          //         iconLink,
          //         height: 45,
          //         color: Theme.of(context).textTheme.bodyText2!.color,
          //       ),
          //     ),
          //   ),
          //   left: 0,
          //   top: 0,
          //   bottom: 0,
          // ),
          Positioned(
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Theme.of(context).textTheme.bodyText2!.color),
              ),
            ),
            left: 65,
            top: 0,
            bottom: 0,
          ),
        ],
      ),
    );
  }
}
