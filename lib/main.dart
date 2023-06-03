import 'dart:convert';
import 'package:demp_flutterapp/Blocs/blocs/employeeBloc.dart';
import 'package:demp_flutterapp/Blocs/states/employeeState.dart';
import 'package:demp_flutterapp/Repository/employeeRepository.dart';
import 'package:demp_flutterapp/Screens/SpashScreen.dart';
import 'package:demp_flutterapp/Screens/employeeDetailScreen.dart';
import 'package:demp_flutterapp/Screens/employeeList.dart';
import 'package:demp_flutterapp/model/employeeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                EmployeeListBloc(EmployeeListState(), EmployeeReposittory())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        // token == 0 || token == null ? '/' : '/dielist',
        routes: {
          '/': (context) => SplashScreen(),
          '/employeeDetails': (context) => EmployeeDetailScreen(),

          // '/finalorderbooking': (context) => FinalOrderBookingScreen(),
        },
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//       future: ReadJsonData(),
//       builder: (context, data) {
//         if (data.hasError) {
//           return Center(child: Text("${data.error}"));
//         } else if (data.hasData) {
//           var items = data.data as List<EmployeeModel>;
//           return ListView.builder(
//               itemCount: items == null ? 0 : items.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           child: Image(
//                             image:
//                                 NetworkImage(items[index].imageUrl.toString()),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Expanded(
//                             child: Container(
//                           padding: EdgeInsets.only(bottom: 8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 8, right: 8),
//                                 child: Text(
//                                   items[index].firstName.toString(),
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 8, right: 8),
//                                 child: Text(items[index].lastName.toString()),
//                               )
//                             ],
//                           ),
//                         ))
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     ));
//   }

//   Future<List<EmployeeModel>> ReadJsonData() async {
//     final jsondata =
//         await rootBundle.loadString('assets/jsonfile/employees.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//     return list.map((e) => EmployeeModel.fromJson(e)).toList();
//   }
// }
