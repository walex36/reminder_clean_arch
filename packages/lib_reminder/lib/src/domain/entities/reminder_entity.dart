import 'package:equatable/equatable.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class Reminder extends Equatable {
  
  final int codigoReminder;
  final String titleReminder;
  final String bodyReminder;

  const Reminder({
    required this.codigoReminder,
    required this.titleReminder,
    required this.bodyReminder,
  });  

  Reminder copyWith({
    int? codigoReminder,
    String? titleReminder,
    String? bodyReminder,
  }) {
    return Reminder(
      codigoReminder: codigoReminder ?? this.codigoReminder,
      titleReminder: titleReminder ?? this.titleReminder,
      bodyReminder: bodyReminder ?? this.bodyReminder,
    );
  }

  @override
  List<Object?> get props {
    return [
      codigoReminder,
      titleReminder,
      bodyReminder,
    ];
  }
}
