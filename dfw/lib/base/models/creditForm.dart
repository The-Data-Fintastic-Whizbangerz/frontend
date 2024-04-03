import 'dart:convert';

class CreditForm {
  String purpose;
  int occupation;
  int employLength;
  String guarantor;
  String house;
  String residentLength;
  int ageGroup;
  String sex;
  int numChild;

  String get getPurpose => purpose;
  set setPurpose(String purpose) => this.purpose = purpose;

  int get getOccupation => occupation;
  set setOccupation(occupation) => this.occupation = occupation;

  int get getEmployLength => employLength;
  set setEmployLength(employLength) => this.employLength = employLength;

  String get getGuarantor => guarantor;
  set setGuarantor(guarantor) => this.guarantor = guarantor;

  String get getHouse => house;
  set setHouse(house) => this.house = house;

  String get getResidentLength => residentLength;
  set setResidentLength(residentLength) => this.residentLength = residentLength;

  int get getAgeGroup => ageGroup;
  set setAgeGroup(ageGroup) => this.ageGroup = ageGroup;

  String get getSex => sex;
  set setSex(sex) => this.sex = sex;

  int get getNumChild => numChild;
  set setNumChild(numChild) => this.numChild = numChild;

  CreditForm({
    required this.purpose,
    required this.occupation,
    required this.employLength,
    required this.guarantor,
    required this.house,
    required this.residentLength,
    required this.ageGroup,
    required this.sex,
    required this.numChild,
  });

  Map<String, dynamic> toMap() {
    return {
      'purpose': purpose,
      'occupation': occupation,
      'employLength': employLength,
      'guarantor': guarantor,
      'house': house,
      'residentLength': residentLength,
      'ageGroup': ageGroup,
      'sex': sex,
      'numChild': numChild,
    };
  }

  factory CreditForm.fromMap(Map<String, dynamic> map) {
    return CreditForm(
      purpose: map['purpose'] ?? '',
      occupation: map['occupation']?.toInt() ?? 0,
      employLength: map['employLength']?.toInt() ?? 0,
      guarantor: map['guarantor'] ?? '',
      house: map['house'] ?? '',
      residentLength: map['residentLength'] ?? '',
      ageGroup: map['ageGroup']?.toInt() ?? 0,
      sex: map['sex'] ?? '',
      numChild: map['numChild']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditForm.fromJson(String source) =>
      CreditForm.fromMap(json.decode(source));
}
