import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Reminder extends Equatable {
  final int codigoReminder;
  final int codigoCategory;
  final String titleReminder;
  final String bodyReminder;
  final Color backgroudReminder;

  const Reminder({
    required this.codigoReminder,
    required this.codigoCategory,
    required this.titleReminder,
    required this.bodyReminder,
    required this.backgroudReminder,
  });

  Reminder copyWith({
    int? codigoReminder,
    int? codigoCategory,
    String? titleReminder,
    String? bodyReminder,
    Color? backgroudReminder,
  }) {
    return Reminder(
      codigoReminder: codigoReminder ?? this.codigoReminder,
      codigoCategory: codigoCategory ?? this.codigoCategory,
      titleReminder: titleReminder ?? this.titleReminder,
      bodyReminder: bodyReminder ?? this.bodyReminder,
      backgroudReminder: backgroudReminder ?? this.backgroudReminder,
    );
  }

  @override
  List<Object?> get props {
    return [
      codigoReminder,
      codigoCategory,
      titleReminder,
      bodyReminder,
      backgroudReminder,
    ];
  }
}
