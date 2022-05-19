part of 'reminder_details_bloc.dart';

class ReminderDetailsState extends Equatable {

  final Reminder reminder;

  const ReminderDetailsState({
    required this.reminder,
  });

  ReminderDetailsState copyWith({
    Reminder? reminder,
    bool? updateList,
  }) {
    return ReminderDetailsState(
      reminder: reminder ?? this.reminder,
    );
  }

  @override
  List<Object?> get props => [
    reminder,
  ];
}
