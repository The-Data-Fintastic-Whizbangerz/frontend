import 'dart:convert';

class CreditForm {
  int creditamount;
  int duration;
  String purpose;
  int disposible;
  int occupation;
  int employLength;
  String guarantor;
  String house;
  String residentLength;
  int ageGroup;
  int numChild;

  int get getCreditamount => creditamount;
  set setCreditamount(creditamount) => this.creditamount = creditamount;

  int get getDuration => duration;
  set setDuration(duration) => this.duration = duration;

  String get getPurpose => purpose;
  set setPurpose(String purpose) => this.purpose = purpose;

  int get getDisposible => disposible;
  set setDisposible(disposible) => this.disposible = disposible;

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

  int get getNumChild => numChild;
  set setNumChild(numChild) => this.numChild = numChild;

  CreditForm({
    required this.creditamount,
    required this.duration,
    required this.purpose,
    required this.disposible,
    required this.occupation,
    required this.employLength,
    required this.guarantor,
    required this.house,
    required this.residentLength,
    required this.ageGroup,
    required this.numChild,
  });

  Map<String, dynamic> toMap() {
    return {
      'creditamount': creditamount,
      'duration': duration,
      'purpose': purpose,
      'disposible': disposible,
      'occupation': occupation,
      'employLength': employLength,
      'guarantor': guarantor,
      'house': house,
      'residentLength': residentLength,
      'ageGroup': ageGroup,
      'numChild': numChild,
    };
  }

  factory CreditForm.fromMap(Map<String, dynamic> map) {
    return CreditForm(
      creditamount: map['creditamount']?.toInt() ?? 0,
      duration: map['duration']?.toInt() ?? 0,
      purpose: map['purpose'] ?? '',
      disposible: map['disposible']?.toInt() ?? 0,
      occupation: map['occupation']?.toInt() ?? 0,
      employLength: map['employLength']?.toInt() ?? 0,
      guarantor: map['guarantor'] ?? '',
      house: map['house'] ?? '',
      residentLength: map['residentLength'] ?? '',
      ageGroup: map['ageGroup']?.toInt() ?? 0,
      numChild: map['numChild']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditForm.fromJson(String source) =>
      CreditForm.fromMap(json.decode(source));
}
