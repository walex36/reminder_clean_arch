part of 'reminder_details_bloc.dart';

@immutable
abstract class ReminderDetailsEvent extends Equatable {}

class InitReminderDetails extends ReminderDetailsEvent {
  final Reminder reminder;

  InitReminderDetails({
    required this.reminder,
  });

  @override
  List<Object?> get props => [
        reminder,
      ];
}

class ChangeTitleReminder extends ReminderDetailsEvent {
  final String titleReminder;

  ChangeTitleReminder({
    required this.titleReminder,
  });

  @override
  List<Object?> get props => [
        titleReminder,
      ];
}

class ChangeBodyReminder extends ReminderDetailsEvent {
  final String bodyReminder;

  ChangeBodyReminder({
    required this.bodyReminder,
  });

  @override
  List<Object?> get props => [
        bodyReminder,
      ];
}

class ChangeColorReminder extends ReminderDetailsEvent {
  final Color colorReminder;

  ChangeColorReminder({
    required this.colorReminder,
  });

  @override
  List<Object?> get props => [
        colorReminder,
      ];
}
