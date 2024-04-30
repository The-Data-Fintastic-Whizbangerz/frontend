import 'dart:async';
import 'dart:convert';

import 'package:The_Data_Fintastic_Whizbangerz_Group/base/models/creditForm.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  // final url = 'http://127.0.0.1:5000';
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

  Future<double> submitData({
    required int? creditAmount,
    required int? duration,
    required String? purpose,
    required int? disposible,
    required int? numExistCredit,
    required int? statusExistCredit,
    required int? creditHistory,
    required String? isOtherPlans,
    required String? isEmployed,
    required int? employLength,
    required int? housing,
    required int? numChild,
  }) async {
    var response;
    try {
      CreditForm creditForm = CreditForm.fromMap({
        'creditAmount': creditAmount,
        'duration': duration,
        'purpose': purpose,
        'disposible': disposible,
        'numExistCredit': (numExistCredit),
        'statusExistCredit': (statusExistCredit),
        'creditHistory': creditHistory,
        'isOtherPlans': isOtherPlans,
        'isEmployed': isEmployed,
        'employLength': (employLength),
        'housing': (housing),
        'numChild': (numChild),
      });

      response = await http.post(Uri.parse(url + '/api/predict'),
          // headers: {'Accept': 'application/json'}, body: json.encode(map));
          headers: {'Accept': 'application/json'},
          body: creditForm.toJson());
      return double.parse(json.decode(response.body)["predict"]);
    } catch (e) {
      // print(e);
    }
    return 0;
  }
}
