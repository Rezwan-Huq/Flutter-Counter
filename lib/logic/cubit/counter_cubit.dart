import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/constants/enums.dart';
import 'package:flutter_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter_counter/logic/cubit/internet_state.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit( )
      : super(const CounterState(counterValue: 0));
  void increment() => emit(CounterState(
      counterValue: state.counterValue! + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue! - 1, wasIncremented: false));
}
