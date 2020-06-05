class Education {
  final String school;
  final String course;
  final String start;
  final String end;

  Education({
    this.school,
    this.course,
    this.start,
    this.end
  });

  Education fromJson(Map<String, dynamic> json) {
    return Education(
      school: json['school'],
      course: json['course'],
      start: json['start'],
      end: json['end']
    );
  }

}

class EducationList {
  final List<Education> education;

  EducationList({
    this.education
  });

  EducationList fromJson(List<dynamic> json) {
    List<Education> education = new List<Education>();
    education = json.map((e) => Education().fromJson(e)).toList();

    return EducationList(
      education: education
    );
  }
}