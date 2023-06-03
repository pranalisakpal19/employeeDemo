import 'package:demp_flutterapp/model/employeeModel.dart';
import 'package:equatable/equatable.dart';

class EmployeeListState extends Equatable {
  @override
  // ignore: todo
  // s
  List<Object> get props => [];
}

class EmployeeListIntialState extends EmployeeListState {}

class EmployeeListLoadingState extends EmployeeListState {}

// ignore: must_be_immutable
class EmployeeListFetchSuccess extends EmployeeListState {
  List<EmployeeModel> employeeModel;
  EmployeeListFetchSuccess({required this.employeeModel});
}

// ignore: must_be_immutable
class EmployeeListErrorState extends EmployeeListState {
  String? message;
  EmployeeListErrorState({this.message});
}
