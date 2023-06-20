import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_resume_task/Utils/AppColor/app_color.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';

class RoundTextField extends StatelessWidget {
  double? width;
  double? height;
  double? fontSize;
  String? hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool showBorder;
  TextEditingController controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  void Function(String)? onChanged;
  void Function()? onTap;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? contentPadding;
  late RxBool isVisibility;
  Color? color;
  int? maxLines;
  bool readOnly;
  TextInputType? keyboardType;

  RoundTextField({
    required this.controller,
    this.obscureText,
    this.onTap,
    this.prefixIcon,
    this.color,
    this.keyboardType,
    this.maxLines,
    this.width,
    this.fontSize,
    this.validator,
    this.height,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.margin,
    this.contentPadding,
    this.showBorder = false,
    this.readOnly = false,
  }) {
    isVisibility = (obscureText ?? false).obs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 55,
      margin: margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? AppColor.primaryMidColor,
        borderRadius: BorderRadius.circular(12),
        border: showBorder ? Border.all(color: AppColor.grey.withOpacity(0.5)) : null,
      ),
      child: Obx(
        () => TextFormField(
          controller: controller,
          obscureText: isVisibility.value,
          readOnly: readOnly,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
            hintText: hintText ?? '',
            hintStyle: MyStyle.light12.copyWith(color: AppColor.greyText),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            labelStyle: MyStyle.light12,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon ??
                (obscureText ?? false
                    ? GestureDetector(
                        onTap: () {
                          isVisibility.value = !isVisibility.value;
                        },
                        child: Icon(
                          isVisibility.value ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,
                          size: 23,
                        ),
                      )
                    : null),
          ),
          onChanged: onChanged,
          onTap: onTap,
          validator: validator,
        ),
      ),
    );
  }
}
