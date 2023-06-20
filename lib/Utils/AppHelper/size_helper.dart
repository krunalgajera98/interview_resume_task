import 'package:flutter/material.dart';
import 'package:interview_resume_task/Utils/AppHelper/dimensions.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension WidEx on Widget {
  Widget get beResponsive => ResponsiveWrapper.builder(
        this,
        defaultScale: true,
        defaultScaleFactor: 1.05,
        breakpoints: [
          const ResponsiveBreakpoint.resize(800, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      );
}

/// 10
Widget get vertical10 => const SizedBox(
      height: Dimensions.SPACE_10,
    );

Widget get horizontal10 => const SizedBox(
      width: Dimensions.SPACE_10,
    );

/// 15

Widget get vertical15 => const SizedBox(
      height: Dimensions.SPACE_15,
    );

Widget get horizontal15 => const SizedBox(
      width: Dimensions.SPACE_15,
    );

/// 20

Widget get vertical20 => const SizedBox(
      height: Dimensions.SPACE_20,
    );

Widget get horizontal20 => const SizedBox(
      width: Dimensions.SPACE_20,
    );

/// custom
Widget horizontal({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget vertical({required double? height}) {
  return SizedBox(
    height: height,
  );
}
