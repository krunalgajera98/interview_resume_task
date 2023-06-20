import 'dart:typed_data';
import 'package:interview_resume_task/Models/resume_model.dart';
import 'package:interview_resume_task/Screen/resumePreview/components.dart';
import 'package:interview_resume_task/Utils/AppString/app_string.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

Future<Uint8List> generateDocument(context, {required ResumeModel resumeModel}) async {
  final doc = Document(pageMode: PdfPageMode.outlines);

  var regular = await PdfGoogleFonts.nunitoSansRegular();
  var italic = await PdfGoogleFonts.nunitoSansItalic();
  var bold = await PdfGoogleFonts.nunitoSansBold();
  var boldItalic = await PdfGoogleFonts.nunitoSansBoldItalic();

  doc.addPage(
    page(
      resumeModel,
      regular: regular,
      italic: italic,
      bold: bold,
      boldItalic: boldItalic,
    ),
  );

  return await doc.save();
}

MultiPage page(
  ResumeModel resumeModel, {
  required Font regular,
  required Font italic,
  required Font bold,
  required Font boldItalic,
}) {
  return MultiPage(
    pageTheme: PageTheme(
      margin: const EdgeInsets.all(0),
      buildBackground: (Context context) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(color: PdfColors.white),
          ),
          Expanded(
            child: Container(
              color: PdfColor.fromHex('354A21'),
            ),
          ),
        ],
      ),
      theme: ThemeData.withFont(
        base: regular,
        italic: italic,
        bold: bold,
        boldItalic: boldItalic,
      ),
    ),
    build: (context) {
      return [
        Partitions(
          children: [
            Partition(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nameAndJobRole(resumeModel),
                  profile(resumeModel, bold),
                  if (resumeModel.experience != null && resumeModel.experience!.isNotEmpty)
                    sectionTitle(AppString.employmentHistory, bold),
                  if (resumeModel.experience != null && resumeModel.experience!.isNotEmpty)
                    for (var data in resumeModel.experience!)
                      Column(
                        children: [sectionWidgetFull(data, bold)],
                      ),
                ],
              ),
            ),
            Partition(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  phoneAndEmail(resumeModel, bold),
                  if (resumeModel.link != null && resumeModel.link!.isNotEmpty) skillSectionTitle('Links', bold),
                  if (resumeModel.link != null && resumeModel.link!.isNotEmpty)
                    for (var data in resumeModel.link!)
                      Column(
                        children: [linksWidget(data, bold)],
                      ),
                  if (resumeModel.programmingLanguage != null && resumeModel.programmingLanguage!.isNotEmpty)
                    skillSectionTitle(AppString.skill, bold),
                  if (resumeModel.programmingLanguage != null && resumeModel.programmingLanguage!.isNotEmpty)
                    for (var data in resumeModel.programmingLanguage!)
                      Column(
                        children: [skillWidget(data, bold)],
                      ),
                  if (resumeModel.language != null && resumeModel.language!.isNotEmpty)
                    skillSectionTitle(AppString.languages, bold),
                  if (resumeModel.language != null && resumeModel.language!.isNotEmpty)
                    for (var data in resumeModel.language!)
                      Column(
                        children: [skillWidget(data, bold)],
                      ),
                ],
              ),
            ),
          ],
        ),
      ];
    },
  );
}
