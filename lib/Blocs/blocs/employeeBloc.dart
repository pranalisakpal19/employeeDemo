import 'package:demp_flutterapp/Blocs/events/employeeEvent.dart';
import 'package:demp_flutterapp/Blocs/states/employeeState.dart';
import 'package:demp_flutterapp/Repository/employeeRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  EmployeeReposittory? employeeReposittory;
  var url;
  @override
  EmployeeListBloc(EmployeeListState initialState, this.employeeReposittory);
  EmployeeListState get initialState => EmployeeListIntialState();

  @override
  Stream<EmployeeListState> mapEventToState(EmployeeListEvent event) async* {
    if (event is EmployeeListFetchEvent) {
      yield EmployeeListLoadingState();

      try {
        var expense = await employeeReposittory!.ReadJsonData();
        if (expense != null) {
          yield EmployeeListFetchSuccess(employeeModel: expense);
        } else {
          yield EmployeeListLoadingState();
        }
      } catch (_) {
        yield EmployeeListErrorState();
      }
    }
  }
}
