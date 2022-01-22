import 'package:flutter/material.dart';

Padding ImageContainer(Image logo, BuildContext context) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(5), child: logo),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .scaffoldBackgroundColor,
            borderRadius:
            const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 3,
                  color: Theme.of(context).shadowColor)
            ]),
      ));
}