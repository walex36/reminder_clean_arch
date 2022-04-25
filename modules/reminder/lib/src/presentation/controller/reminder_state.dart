part of 'reminder_bloc.dart';

class ReminderState extends Equatable {
  final List<Reminder> reminders;
  final ControlStatus status;

  const ReminderState({
    required this.reminders,
    required this.status,
  });

  ReminderState copyWith({List<Reminder>? reminders, ControlStatus? status}) {
    return ReminderState(
      reminders: reminders ?? this.reminders,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props {
    return [
      reminders,
      status,
    ];
  }
}
