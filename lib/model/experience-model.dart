class Experience {
  final String company;
  final String position;
  final String start;
  final String end;
  final List<String> tasks;

  Experience({
    this.company,
    this.position,
    this.start,
    this.end,
    this.tasks});

  Experience fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'],
      position: json['position'],
      start: json['start'],
      end: json['end'],
      tasks: List.from(json['tasks'])
    );
  }
}

class ExperienceList {
  final List<Experience> experiences;

  ExperienceList({
    this.experiences
  });

  ExperienceList fromJson(List<dynamic> json) {
    List<Experience> experiences = new List<Experience>();
    experiences = json.map((e) => Experience().fromJson(e)).toList();

    return ExperienceList(
      experiences: experiences
    );
  }
}
