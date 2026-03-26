// import 'package:cv_flutter/models/experiences/experience_info_model.dart';
// import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ExperienceInfoCardWidget extends StatelessWidget {
//   final ExperienceInfoModel experienceInfo;
//
//   const ExperienceInfoCardWidget({Key? key, required this.experienceInfo}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicHeight(
//       child:
//       CustomGlassmorphismContainerWidget(
//         child: Padding(
//           padding: const EdgeInsetsGeometry.symmetric(
//             vertical: 15.0,
//             horizontal: 30.0,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             spacing: 12.0,
//             children: [
//               Center(
//                 child: Text(
//                   experienceInfo.title,
//                   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ),
//               if (experienceInfo.hasDetail)
//                 Center(
//                   child: Text(
//                     experienceInfo.detail,
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                 ),
//               Column(
//                 crossAxisAlignment:
//                     experienceInfo.centerInfo
//                         ? CrossAxisAlignment.center
//                         : CrossAxisAlignment.start,
//                 spacing: 8.0,
//                 children:
//                     experienceInfo.listInfoexperienceInfo.map((InfoexperienceInfoModel infoexperienceInfo) {
//                       return Row(
//                         spacing: 8.0,
//                         mainAxisAlignment: experienceInfo.centerInfo
//                             ? MainAxisAlignment.center
//                             : MainAxisAlignment.start,
//                         children: [
//                           // TODO(florent): Replace with .network for Firebase
//                           if (infoexperienceInfo.hasImage)
//                             Image.asset(infoexperienceInfo.imageLink, width: 40),
//                           Flexible(
//                             child: Column(
//                               spacing: 2.0,
//                               crossAxisAlignment:
//                                   experienceInfo.centerInfo
//                                       ? CrossAxisAlignment.center
//                                       : CrossAxisAlignment.start,
//                               children: [
//                                 if (infoexperienceInfo.hasTitle)
//                                   Text(
//                                     infoexperienceInfo.title,
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.titleMedium?.copyWith(
//                                       color:
//                                           Theme.of(
//                                             context,
//                                           ).secondaryHeaderColor,
//                                       height: 1,
//                                     ),
//                                   ),
//                                 RichText(
//                                   text: TextSpan(
//                                     text: infoexperienceInfo.text,
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium?.copyWith(
//                                       decoration:
//                                           infoexperienceInfo.hasLink
//                                               ? TextDecoration.underline
//                                               : null,
//                                     ),
//                                     recognizer:
//                                         infoexperienceInfo.hasLink
//                                             ? (TapGestureRecognizer()
//                                               ..onTap =
//                                                   () => launchUrl(
//                                                     Uri.parse(
//                                                       infoexperienceInfo.urlLink,
//                                                     ),
//                                                   ))
//                                             : null,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
