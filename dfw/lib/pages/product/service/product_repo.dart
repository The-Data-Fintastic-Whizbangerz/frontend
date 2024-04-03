import 'dart:async';
import 'dart:convert';

import 'package:The_Data_Fintastic_Whizbangerz_Group/base/models/creditForm.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final url = 'https://dfw.cthtc.com';

  ProductRepository._();
  static final ProductRepository instance = ProductRepository._();

  Future<void> testAPI() async {
    var response;
    try {
      response = await http.get(Uri.parse(url + '/api'));
      print(json.decode(response.body));
    } catch (e) {
      print(e);
    }
  }

  Future<String> submitData({
    required String purpose,
    required int occupation,
    required int employLength,
    required String guarantor,
    required String house,
    required String residentLength,
    required int ageGroup,
    required String sex,
    required int numChild,
  }) async {
    var response;
    try {
      CreditForm creditForm = CreditForm.fromMap({
        'purpose': purpose,
        'occupation': (occupation),
        'employLength': (employLength),
        'guarantor': guarantor,
        'house': house,
        'residentLength': residentLength,
        'ageGroup': (ageGroup),
        'sex': sex,
        'numChild': (numChild),
      });

      // var map = {};
      // map['Purpose'] = purpose;
      // map['Occupation'] = occupation;
      // map['Employment_length'] = employLength;
      // map['Other_debtors_or_guarantors'] = guarantor;
      // map['Housing'] = house;
      // map['Residence_length'] = residentLength;
      // map['Age_group'] = ageGroup;
      // map['Sex'] = sex;
      // map['Number_of_dependents'] = numChild;

      response = await http.post(Uri.parse(url + '/predict'),
          // headers: {'Accept': 'application/json'}, body: json.encode(map));
          headers: {'Accept': 'application/json'},
          body: creditForm.toJson());
      return (json.decode(response.body)["predict"]);
    } catch (e) {
      print(e);
    }
    return "No result.";
  }
}
