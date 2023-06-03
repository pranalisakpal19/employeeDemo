import 'dart:convert';

import 'package:demp_flutterapp/model/employeeModel.dart';
import 'package:flutter/services.dart';

class EmployeeReposittory {
  Future<List<EmployeeModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.loadString('assets/jsonfile/employees.json');

    List<dynamic> responseJson = json.decode(jsondata);

    List<EmployeeModel> employeeList =
        responseJson.map((d) => EmployeeModel.fromJson(d)).toList();

    employeeList.sort((a, b) {
      return a.firstName!.toLowerCase().compareTo(b.firstName!.toLowerCase());
    });

    return employeeList;
  }
}
