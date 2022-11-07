// ignore_for_file: unused_import, constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_counter/constants/enums.dart';

import 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
