import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/constants/enums.dart';
import 'package:flutter_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter_counter/logic/cubit/internet_state.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(const CounterState(counterValue: 0)) {
    internetCubit.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      }
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }
  void increment() => emit(CounterState(
      counterValue: state.counterValue! + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue! - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}
