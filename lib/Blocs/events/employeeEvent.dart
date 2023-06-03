import 'package:equatable/equatable.dart';

class EmployeeListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class EmployeeListFetchEvent extends EmployeeListEvent {
  String? id;
  EmployeeListFetchEvent({this.id});
}
