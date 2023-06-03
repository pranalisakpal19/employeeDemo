import 'dart:convert';

import 'package:demp_flutterapp/Blocs/blocs/employeeBloc.dart';
import 'package:demp_flutterapp/Blocs/events/employeeEvent.dart';
import 'package:demp_flutterapp/Blocs/states/employeeState.dart';
import 'package:demp_flutterapp/Repository/employeeRepository.dart';
import 'package:demp_flutterapp/model/employeeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeList extends StatefulWidget {
  final productid;
  EmployeeList({this.productid});
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  EmployeeListBloc? employeeListBloc;

  @override
  void initState() {
    //  categoryBloc = CategoryBloc();
    employeeListBloc = BlocProvider.of<EmployeeListBloc>(context);
    employeeListBloc!.add(EmployeeListFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    employeeListBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Employee List",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
        body: BlocBuilder<EmployeeListBloc, EmployeeListState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is EmployeeListIntialState) {
              return CircularProgressIndicator();
            } else if (state is EmployeeListFetchSuccess) {
              final items = state.employeeModel;
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Image(
                                  image: NetworkImage(
                                      items[index].imageUrl.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        items[index].firstName.toString() +
                                            " " +
                                            items[index].lastName.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/employeeDetails',
                            arguments: jsonEncode(items[index]));
                      },
                    );
                  });
            } else if (state is EmployeeListErrorState) {
              //  return ErrorWidget(state.);
            }
            return Container();
          },
        ));
  }
}
