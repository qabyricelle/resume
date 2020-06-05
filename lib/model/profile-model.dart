class Profile {

  final String name;
  final String title;
  final String introduction;
  final String contact;
  final String email;
  final String github;
  final String linkedin;

  Profile({
    this.name, 
    this.title,
    this.introduction,
    this.contact,
    this.email,
    this.github,
    this.linkedin
  });

  Profile fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      title: json['title'],
      introduction: json['introduction'],
      contact: json['contact'],
      email: json['email'],
      github: json['github'],
      linkedin: json['linkedin']
    );
  }



}