part of 'reminder_bloc.dart';

@immutable
abstract class ReminderEvent extends Equatable {}

// Evento para iniciar e verificar os Reminder criados
class InitReminder extends ReminderEvent {
  @override
  List<Object?> get props => [];
}

// Evento para criar um novo Reminder
class CreateReminder extends ReminderEvent {
  final int codigoReminder;
  final int codigoCategory;
  final String titleReminder;
  final String bodyReminder;
  final Color backgroudReminder;
  final bool openReminder;

  CreateReminder({
    required this.codigoReminder,
    required this.codigoCategory,
    required this.titleReminder,
    required this.bodyReminder,
    required this.backgroudReminder,
    this.openReminder = false,
  });

  @override
  List<Object?> get props => [
        codigoReminder,
        codigoCategory,
        titleReminder,
        bodyReminder,
        backgroudReminder,
      ];
}

class UpdateReminder extends ReminderEvent {
  final Reminder reminder;

  UpdateReminder({
    required this.reminder,
  });

  @override
  List<Object?> get props => [
        reminder,
      ];
}

class SelectReminder extends ReminderEvent {
  final Reminder reminderSelect;

  SelectReminder({
    required this.reminderSelect,
  });

  @override
  List<Object?> get props => [
        reminderSelect,
      ];
}

//Evento para remover Reminder
class RemoveReminder extends ReminderEvent {
  @override
  List<Object?> get props => [];
}

class EditReminder extends ReminderEvent {
  final Reminder reminderEdit;

  EditReminder({required this.reminderEdit});

  @override
  List<Object?> get props => [reminderEdit];
}
