
class StudentModel {
  String? name;
  int? id;
  String? guardianName;
  String? diagnose;
  String? age;
  String? guardianPhone;
  String? image;
  String? gendar;

  StudentModel({
    this.name,
    this.id,
    this.gendar,
    this.image,
    this.guardianName,
    this.diagnose,
    this.age,
    this.guardianPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'guardian_name': guardianName,
      'age': age,
      'diagnose': diagnose,
      'guardian_phone': guardianPhone,
      'image': image,
      'gendar': gendar,
    };
  }

  factory StudentModel.fromJson(dynamic json) {
    return StudentModel(
      name: json['name'],
      id: json['id'],
      gendar: json['gendar'],
      image: json['image'],
      guardianName: json['guardian_name'],
      age: json['age'],
      diagnose: json['diagnose'],
      guardianPhone: json['guardian_phone'],
    );
  }
}
