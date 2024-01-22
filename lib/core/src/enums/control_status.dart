
import 'package:flutter/foundation.dart';

enum ControlStatus{
  initial,
  empty,
  loading,
  success,
  failure,
}

extension ControlStatusExtension on ControlStatus{
  String toShortString() => describeEnum(this);

  bool get isInitial => this == ControlStatus.initial;
  bool get isEmpty => this == ControlStatus.empty;
  bool get isLoading => this == ControlStatus.loading;
  bool get isSuccess => this == ControlStatus.success;
  bool get isFailure => this == ControlStatus.failure;

  bool get isNotInitial => this != ControlStatus.initial;
  bool get isNotEmpty => this != ControlStatus.empty;
  bool get isNotLoading => this != ControlStatus.loading;
  bool get isNotSuccess => this != ControlStatus.success;
  bool get isNotFailure => this != ControlStatus.failure;
}