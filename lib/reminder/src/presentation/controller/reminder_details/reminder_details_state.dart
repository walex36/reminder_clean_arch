part of 'reminder_details_bloc.dart';

class ReminderDetailsState extends Equatable {
  final Reminder reminder;
  final ControlStatus status;

  const ReminderDetailsState({
    required this.reminder,
    required this.status,
  });

  ReminderDetailsState copyWith({
    Reminder? reminder,
    ControlStatus? status,
  }) {
    return ReminderDetailsState(
      reminder: reminder ?? this.reminder,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        reminder,
        status,
      ];
}
