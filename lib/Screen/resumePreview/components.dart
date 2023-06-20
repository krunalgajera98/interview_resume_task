import 'package:interview_resume_task/Models/resume_model.dart';
import 'package:interview_resume_task/Utils/AppString/app_string.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';

Widget nameAndJobRole(ResumeModel resumeModel) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 36, bottom: 16, left: 36, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(resumeModel.firstName ?? "", style: const TextStyle(fontSize: 24)),
              SizedBox(width: 5),
              Text(resumeModel.lastName ?? "", style: const TextStyle(fontSize: 24)),
            ],
          ),
          if (resumeModel.jobRole != null)
            Text(
              resumeModel.jobRole!.toUpperCase(),
              style: const TextStyle(
                letterSpacing: 1.2,
                wordSpacing: 1.3,
                fontSize: 8,
                color: PdfColors.grey500,
              ),
            ),
        ],
      ),
    ),
  );
}

Widget sectionTitle(String title, Font bold) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.only(top: 16, left: 36, right: 24),
      child: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: PdfColors.black,
            fontBold: bold,
            fontSize: 13,
          )),
    ),
  ]);
}

Widget skillSectionTitle(String title, Font bold) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 8),
      child: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: PdfColors.white,
            fontBold: bold,
            fontSize: 13,
          )),
    ),
  ]);
}

Widget skillWidget(String skill, Font bold) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 30, bottom: 2),
    child: Text(
      skill ?? "",
      style: const TextStyle(
        color: PdfColors.white,
        fontSize: 10,
      ),
    ),
  );
}

Widget linksWidget(LinkData links, Font bold) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 30, bottom: 2),
    child: UrlLink(
        child: Text(
          links.linkName ?? "",
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: PdfColors.white,
            fontSize: 10,
          ),
        ),
        destination: links.linkUrl ?? ""),
  );
}

Widget profile(ResumeModel resumeModel, Font bold) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 16, left: 36, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (resumeModel.summary != null)
            Text("Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PdfColors.black,
                  fontBold: bold,
                  fontSize: 13,
                )),
          SizedBox(height: 8),
          Container(
            child: Expanded(
              child: Text(
                resumeModel.summary ?? "",
                style: const TextStyle(
                  color: PdfColors.black,
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget sectionWidgetFull(Experience section, Font bold) {
  String sectionTitle = '';
  String date = '';
  if (section.role != null) {
    sectionTitle += section.role! + ", ";
  }
  if (section.jobTitle != null) {
    sectionTitle += section.jobTitle!;
  }
  if (section.city != null) {
    sectionTitle += section.city! + ", ";
  }

  if (section.startDate != null) {
    date += section.startDate! + " - ";
  }
  if (section.endDate != null) {
    date += section.endDate!;
  }

  return Container(
    padding: const EdgeInsets.only(top: 16, left: 36, right: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: Expanded(
          child: Text(sectionTitle, style: TextStyle(fontBold: bold, fontWeight: FontWeight.bold, fontSize: 11)),
        )),
        SizedBox(height: 4),
        Text(date.toUpperCase(),
            style: const TextStyle(
              letterSpacing: 1.2,
              wordSpacing: 1.3,
              fontSize: 8,
              color: PdfColors.grey500,
            )),
        SizedBox(height: 8),
      ],
    ),
  );
}

Widget phoneAndEmail(ResumeModel personal, Font bold) {
  return Padding(
    padding: const EdgeInsets.only(top: 100 + 16, left: 24, right: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        if (personal.email != null || personal.phoneNumber != null)
          Text(
            AppString.details,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: PdfColors.white,
              fontBold: bold,
              fontSize: 13,
            ),
          ),
        SizedBox(height: 8),
        Text(personal.email ?? "",
            style: const TextStyle(
              color: PdfColors.white,
              fontSize: 10,
            )),
        SizedBox(height: 2),
        Text(
          personal.phoneNumber ?? "",
          style: const TextStyle(
            color: PdfColors.white,
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
