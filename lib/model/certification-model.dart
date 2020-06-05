class Certification {
  
  final String certificate;
  final String issuer;
  final double score;
  final String issued;


  Certification({
    this.certificate,
    this.issuer,
    this.score,
    this.issued
  });

  Certification fromJson(Map<String, dynamic> json) {
    return Certification(
      certificate: json['certificate'],
      issuer: json['issuer'],
      score: json['score'],
      issued: json['issued']
    );
  }

}

class CertificateList {
  final List<Certification> certifications;

  CertificateList({
    this.certifications
  });

  CertificateList fromJson(List<dynamic> json) {
    List<Certification> certifications = new List<Certification>();
    certifications = json.map((e) => Certification().fromJson(e)).toList();

    return CertificateList(
      certifications: certifications
    );
  }
}