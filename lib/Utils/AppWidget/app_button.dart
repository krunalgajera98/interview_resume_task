import 'package:flutter/material.dart';
import 'package:interview_resume_task/Utils/AppColor/app_color.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';

class AppButton extends StatelessWidget {
  double? width;
  double? height;
  double? radius;
  String? text;
  Widget? child;
  bool isGradiant;
  Color? color;
  TextStyle? style;
  BoxBorder? border;
  Color? textColor;
  void Function()? onTap;

  AppButton({
    this.text,
    this.style,
    this.color,
    this.height,
    this.width,
    this.radius,
    this.child,
    this.border,
    this.textColor,
    this.isGradiant = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 42,
        width: width ?? MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColor.primaryColor,
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
        child: child ??
            Text(
              text ?? '',
              style: style ?? MyStyle.medium14.copyWith(color: textColor ?? AppColor.white),
            ),
      ),
    );
  }
}
