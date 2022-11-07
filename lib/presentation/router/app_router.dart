// ignore_for_file: unused_import, unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_counter/presentation/screens/home_screen.dart';
import 'package:flutter_counter/presentation/screens/second_screen.dart';
import 'package:flutter_counter/presentation/screens/third_screen.dart';

class ApprRouter {
  final CounterCubit _counterCubit = CounterCubit(internetCubit: null);

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MyHomeScreen(
                title: 'HomeScreen', color: Colors.blueAccent));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: 'SecondScreen', color: Colors.redAccent));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: 'ThirdScreen', color: Colors.greenAccent));

      default:
        return null;
    }
  }
}

































// "This is for Generated Routing"


// class ApprRouter {
//   final CounterCubit _counterCubit = CounterCubit();

//   Route? onGenerateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case '/':
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//                   value: _counterCubit,
//                   child: const MyHomeScreen(
//                       title: 'HomeScreen', color: Colors.blueAccent),
//                 ));
//       case '/second':
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//                   value: _counterCubit,
//                   child: const SecondScreen(
//                       title: 'SecondScreen', color: Colors.redAccent),
//                 ));
//       case '/third':
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//                   value: _counterCubit,
//                   child: const ThirdScreen(
//                       title: 'ThirdScreen', color: Colors.greenAccent),
//                 ));

//       default:
//         return null;
//     }
//   }

//   void dispose() {
//     _counterCubit.close();
//   }
// }
