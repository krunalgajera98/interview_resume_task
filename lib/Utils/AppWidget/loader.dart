import 'package:flutter/material.dart';
import 'package:interview_resume_task/Utils/AppColor/app_color.dart';

class Loader extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final bool fullSize;

  const Loader({super.key, this.color, this.width, this.height, this.fullSize = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: fullSize ? Colors.grey.withOpacity(0.5) : null,
        height: fullSize ? double.infinity : height ?? 25,
        width: fullSize ? double.infinity : width ?? 25,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColor.white,
        ),
      ),
    );
  }
}
