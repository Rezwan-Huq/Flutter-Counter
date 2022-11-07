// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_counter/logic/cubit/counter_cubit.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('CounterCubit', () {
//     CounterCubit counterCubit = CounterCubit();
//     // CounterCubit counterCubit;
//     setUp(() {
//       counterCubit = CounterCubit();
//     });
//     tearDown(() {
//       counterCubit.close();
//     });

//     test(
//         'the initial state for the Countercubit is CounterState(counterValue:0)',
//         () {
//       expect(counterCubit.state, const CounterState(counterValue: 0));
//     });
//     blocTest(
//       'the cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
//       build: () => counterCubit,
//       act: (cubit) => cubit.increment(),
//       // expect: [const CounterState(counterValue: 1, wasIncremented: true)],
//     );
//       blocTest(
//       'the cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when cubit.increment() function is called',
//       build: () => counterCubit,
//       act: (cubit) => cubit.increment(),
//       // expect: [const CounterState(counterValue: -1, wasIncremented: false)],
//     );
//   });
// }
