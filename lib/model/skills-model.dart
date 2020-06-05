class Skills {
  
  final String skill;
  final int rate;


  Skills ({
    this.skill,
    this.rate
  });

  Skills fromJson(Map<String, dynamic> json) {
    return Skills(
      skill: json['skills'],
      rate: json['rate']
    );
  }

}

class SkillsList {
  final List<Skills> skills;

  SkillsList({
    this.skills
  });

  SkillsList fromJson(List<dynamic> json) {
    List<Skills> skills = new List<Skills>();
    skills = json.map((e) => Skills().fromJson(e)).toList();

    return SkillsList(
      skills: skills
    );
  }
}