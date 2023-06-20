import 'dart:convert';

List<ResumeModel> resumeModelListFromJson(String str) =>
    List<ResumeModel>.from(json.decode(str).map((x) => ResumeModel.fromJson(x)));

String resumeModelListToJson(List<ResumeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

ResumeModel resumeModelFromJson(String str) => ResumeModel.fromJson(json.decode(str));

String resumeModelToJson(ResumeModel data) => json.encode(data.toJson());

class ResumeModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? jobRole;
  String? phoneNumber;
  String? summary;
  List<LinkData>? link;
  List<Experience>? experience;
  List<String>? programmingLanguage;
  List<String>? language;

  ResumeModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.jobRole,
    this.phoneNumber,
    this.summary,
    this.link,
    this.experience,
    this.programmingLanguage,
    this.language,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) => ResumeModel(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        jobRole: json["jobRole"],
        phoneNumber: json["phoneNumber"],
        summary: json["summary"],
        link: json["link"] == null ? [] : List<LinkData>.from(json["link"]!.map((x) => LinkData.fromJson(x))),
        experience: json["experience"] == null
            ? []
            : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
        programmingLanguage:
            json["programmingLanguage"] == null ? [] : List<String>.from(json["programmingLanguage"]!.map((x) => x)),
        language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "jobRole": jobRole,
        "phoneNumber": phoneNumber,
        "summary": summary,
        "link": link == null ? [] : List<dynamic>.from(link!.map((x) => x.toJson())),
        "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "programmingLanguage":
            programmingLanguage == null ? [] : List<dynamic>.from(programmingLanguage!.map((x) => x)),
        "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
      };
}

class Experience {
  String? jobTitle;
  String? startDate;
  String? endDate;
  String? city;
  String? role;

  Experience({
    this.jobTitle,
    this.startDate,
    this.endDate,
    this.city,
    this.role,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        jobTitle: json["jobTitle"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        city: json["city"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "jobTitle": jobTitle,
        "startDate": startDate,
        "endDate": endDate,
        "city": city,
        "role": role,
      };
}

class LinkData {
  String? linkName;
  String? linkUrl;

  LinkData({
    this.linkName,
    this.linkUrl,
  });

  factory LinkData.fromJson(Map<String, dynamic> json) => LinkData(
        linkName: json["linkName"],
        linkUrl: json["linkUrl"],
      );

  Map<String, dynamic> toJson() => {
        "linkName": linkName,
        "linkUrl": linkUrl,
      };
}
