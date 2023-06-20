import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_resume_task/Models/resume_model.dart';
import 'package:interview_resume_task/Screen/resumePreview/view/template_personal.dart';
import 'package:interview_resume_task/Utils/AppColor/app_color.dart';
import 'package:interview_resume_task/Utils/AppHelper/size_helper.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';
import 'package:printing/printing.dart';

class PdfDisplay extends StatelessWidget {
  static const routeName = '/PdfDisplay';
  ResumeModel? resumeModel;

  PdfDisplay({this.resumeModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryLightColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: AppColor.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Preview',
          style: MyStyle.bold18.copyWith(color: AppColor.white),
        ),
        backgroundColor: AppColor.primaryColor,
        shadowColor: Colors.black.withOpacity(0.3),
        elevation: 0,
      ),
      body: Theme(
        data: ThemeData(
          primaryColor: AppColor.backGroundColor,
          primaryIconTheme: const IconThemeData(
            color: AppColor.primaryColor,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 156,
            child: PdfPreview(
              loadingWidget: const CupertinoActivityIndicator(),
              scrollViewDecoration: const BoxDecoration(
                color: AppColor.primaryLightColor,
              ),
              pdfPreviewPageDecoration: const BoxDecoration(),
              useActions: false,
              allowPrinting: true,
              allowSharing: true,
              canDebug: false,
              canChangeOrientation: false,
              canChangePageFormat: false,
              build: (format) => generateDocument(
                context,
                resumeModel: resumeModel ?? ResumeModel(),
              ),
            ),
          ),
        ),
      ),
    ).beResponsive;
  }
}
