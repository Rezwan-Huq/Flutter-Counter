import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/constants/enums.dart';
import 'package:flutter_counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_counter/logic/cubit/internet_cubit.dart';

import '../../logic/cubit/internet_state.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          context.read<CounterCubit>().increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return const Text('Wifi');
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return const Text('Mobile');
                  } else if (state is InternetDisconnected) {
                    return const Text('Disconnected');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              // ignore: prefer_const_constructors
              Divider(
                height: 5,
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.counterValue! < 0) {
                    return Text(
                      ' NEGATIVE ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue! == 0) {
                    return Text(
                      'START ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue! % 2 == 0 &&
                      state.counterValue! > 1) {
                    return Text(
                      'YAAAY ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'HMM, NUMBER 5',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: Text(widget.title),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //         // context.bloc<CounterCubit>().decrement();
              //       },
              //       tooltip: 'Decrement',
              //       child: const Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       heroTag: Text('${widget.title} 2nd'),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //         // context.bloc<CounterCubit>().increment();
              //       },
              //       tooltip: 'Increment',
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: widget.color,
                child: const Text(
                  'Go to Second Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: widget.color,
                child: const Text(
                  'Go to Third Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
