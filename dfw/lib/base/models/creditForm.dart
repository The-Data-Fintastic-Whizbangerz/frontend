import 'dart:convert';

class CreditForm {
  int? creditAmount;
  int? duration;
  String? purpose;
  int? disposible;
  int? numExistCredit;
  int? statusExistCredit;
  int? creditHistory;
  String? isOtherPlans;
  String? isEmployed;
  int? employLength;
  int? housing;
  int? numChild;

  get getCreditAmount => this.creditAmount;

  set setCreditAmount(int? creditAmount) => this.creditAmount = creditAmount;

  get getDuration => this.duration;

  set setDuration(duration) => this.duration = duration;

  get getPurpose => this.purpose;

  set setPurpose(purpose) => this.purpose = purpose;

  get getDisposible => this.disposible;

  set setDisposible(disposible) => this.disposible = disposible;

  get getNumExistCredit => this.numExistCredit;

  set setNumExistCredit(numExistCredit) => this.numExistCredit = numExistCredit;

  get getStatusExistCredit => this.statusExistCredit;

  set setStatusExistCredit(statusExistCredit) =>
      this.statusExistCredit = statusExistCredit;

  get getCreditHistory => this.creditHistory;

  set setCreditHistory(creditHistory) => this.creditHistory = creditHistory;

  get getIsOtherPlans => this.isOtherPlans;

  set setIsOtherPlans(isOtherPlans) => this.isOtherPlans = isOtherPlans;

  get getIsEmployed => this.isEmployed;

  set setIsEmployed(isEmployed) => this.isEmployed = isEmployed;

  get getEmployLength => this.employLength;

  set setEmployLength(employLength) => this.employLength = employLength;

  get getHousing => this.housing;

  set setHousing(housing) => this.housing = housing;

  get getNumChild => this.numChild;

  set setNumChild(numChild) => this.numChild = numChild;

  CreditForm({
    this.creditAmount,
    this.duration,
    this.purpose,
    this.disposible,
    this.numExistCredit,
    this.statusExistCredit,
    this.creditHistory,
    this.isOtherPlans,
    this.isEmployed,
    this.employLength,
    this.housing,
    this.numChild,
  });

  Map<String, dynamic> toMap() {
    return {
      'creditAmount': creditAmount,
      'duration': duration,
      'purpose': purpose,
      'disposible': disposible,
      'numExistCredit': numExistCredit,
      'statusExistCredit': statusExistCredit,
      'creditHistory': creditHistory,
      'isOtherPlans': isOtherPlans,
      'isEmployed': isEmployed,
      'employLength': employLength,
      'housing': housing,
      'numChild': numChild,
    };
  }

  factory CreditForm.fromMap(Map<String, dynamic> map) {
    return CreditForm(
      creditAmount: map['creditAmount']?.toInt(),
      duration: map['duration']?.toInt(),
      purpose: map['purpose'],
      disposible: map['disposible']?.toInt(),
      numExistCredit: map['numExistCredit']?.toInt(),
      statusExistCredit: map['statusExistCredit']?.toInt(),
      creditHistory: map['creditHistory']?.toInt(),
      isOtherPlans: map['isOtherPlans'],
      isEmployed: map['isEmployed'],
      employLength: map['employLength']?.toInt(),
      housing: map['housing']?.toInt(),
      numChild: map['numChild']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditForm.fromJson(String source) =>
      CreditForm.fromMap(json.decode(source));
}
