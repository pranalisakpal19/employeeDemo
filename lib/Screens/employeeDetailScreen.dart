import 'dart:convert';

import 'package:demp_flutterapp/model/employeeModel.dart';
import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatefulWidget {
  const EmployeeDetailScreen({Key? key}) : super(key: key);

  @override
  _EmployeeDetailScreenState createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  EmployeeModel? employeeModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var employeeString = ModalRoute.of(context)?.settings.arguments as String;
    print(employeeString);

    var employeeJson = jsonDecode(employeeString);
    print(employeeJson);

    setState(() {
      employeeModel = EmployeeModel.fromJson(employeeJson);
      // employeeName = product!.firstName!;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Details"),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Container(
                width: 100,
                height: 100,
                child: Image(
                  image: NetworkImage(employeeModel!.imageUrl.toString()),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      width: 400,
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Name : " +
                                            (employeeModel!.firstName
                                                    .toString() +
                                                " " +
                                                employeeModel!.lastName
                                                    .toString()),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0)))),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Eamil Id : " +
                                            (employeeModel!.email.toString()),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0)))),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Contact No : " +
                                          (employeeModel!.contactNumber
                                              .toString()),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0)),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Age : " +
                                          (employeeModel!.age.toString()),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0)),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "DOB : " +
                                          (employeeModel!.dob.toString()),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0)),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Salary : " +
                                          (employeeModel!.salary.toString()),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0)),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Address : " +
                                          (employeeModel!.address.toString()),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0)),
                                ))
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
