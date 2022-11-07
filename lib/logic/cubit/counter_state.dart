part of 'counter_cubit.dart';

class CounterState extends Equatable   {
  final int? counterValue;
  final bool? wasIncremented;
  const CounterState({
     this.counterValue,
      this.wasIncremented,
  });
  
  @override
  // ignore: todo
  // TODO: implemen t props
  // ignore: unnecessary_this
  List<Object?> get props => [this.counterValue, this.wasIncremented];
}
