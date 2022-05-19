part of 'reminder_bloc.dart';

class ReminderState extends Equatable {
  final List<Reminder> reminders;
  final ControlStatus status;
  final List<Reminder> remindersSelect;

  const ReminderState({
    required this.reminders,
    required this.status,
    required this.remindersSelect,
  });

  ReminderState copyWith({List<Reminder>? reminders, ControlStatus? status, List<Reminder>? remindersSelect,}) {
    return ReminderState(
      reminders: reminders ?? this.reminders,
      status: status ?? this.status,
      remindersSelect: remindersSelect ?? this.remindersSelect,
    );
  }

  @override
  List<Object?> get props {
    return [
      reminders,
      status,
      remindersSelect,
    ];
  }
}
