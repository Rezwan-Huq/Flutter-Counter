import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter_counter/presentation/router/app_router.dart';

void main() {
  // const CounterState counterState1 = CounterState(counterValue: 1);
  // const CounterState counterState2 = CounterState(counterValue: 1);
  // print(counterState1 == counterState2);
  runApp(MyApp(
    appRouter: ApprRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final ApprRouter appRouter;
  final Connectivity connectivity;

  const MyApp({super.key, required this.appRouter, required this.connectivity});

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // ignore: unused_field
//   // final CounterCubit _counterCubit = CounterCubit();
//   final ApprRouter _apprRouter = ApprRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,

        // "This is for Named Routing"

        // routes: {
        //   '/': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const MyHomeScreen(
        //             title: 'HomeScreen', color: Colors.blueAccent),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         // ignore: prefer_const_constructors
        //         child: SecondScreen(
        //             title: 'SecondScreen', color: Colors.redAccent),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        //         value: CounterCubit(),
        //         // ignore: prefer_const_constructors
        //         child: ThirdScreen(
        //             title: 'ThirdScreen', color: Colors.greenAccent),
        //       ),
        // },
      ),
    );
  }
}

  // @override
  // void dispose() {
  //   // _counterCubit.close();
  //   _apprRouter.dispose();
  //   super.dispose();
  // }





// class MyHomeScreen extends StatefulWidget {
//   const MyHomeScreen({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomeScreen> createState() => _MyHomeScreenState();
// }

// class _MyHomeScreenState extends State<MyHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: BlocListener<CounterCubit, CounterState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               BlocConsumer<CounterCubit, CounterState>(
//                 listener: (context, state) {
//                   if (state.wasIncremented == true) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Incremented!'),
//                         duration: Duration(milliseconds: 300),
//                       ),
//                     );
//                   } else if (state.wasIncremented == false) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Decremented!'),
//                         duration: Duration(milliseconds: 300),
//                       ),
//                     );
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state.counterValue! < 0) {
//                     return Text(
//                       ' NEGATIVE ${state.counterValue}',
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   } else if (state.counterValue! == 0) {
//                     return Text(
//                       'START ${state.counterValue}',
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   } else if (state.counterValue! % 2 == 0 &&
//                       state.counterValue! > 1) {
//                     return Text(
//                       'YAAAY ${state.counterValue}',
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   } else if (state.counterValue == 5) {
//                     return Text(
//                       'HMM, NUMBER 5',
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   } else {
//                     return Text(
//                       state.counterValue.toString(),
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   }
//                 },
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FloatingActionButton(
//                     onPressed: () {
//                       BlocProvider.of<CounterCubit>(context).decrement();
//                       // context.bloc<CounterCubit>().decrement();
//                     },
//                     tooltip: 'Decrement',
//                     child: const Icon(Icons.remove),
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       BlocProvider.of<CounterCubit>(context).increment();
//                       // context.bloc<CounterCubit>().increment();
//                     },
//                     tooltip: 'Increment',
//                     child: const Icon(Icons.add),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
