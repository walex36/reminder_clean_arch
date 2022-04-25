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
  final String titleReminder;
  final String bodyReminder;

  CreateReminder({
    required this.codigoReminder,
    required this.titleReminder,
    required this.bodyReminder,
  });

  @override
  List<Object?> get props => [
        codigoReminder,
        titleReminder,
        bodyReminder,
      ];
}

class RemoveReminder extends ReminderEvent {
  final List<Reminder> remindersRemove;

  RemoveReminder({required this.remindersRemove});

  @override
  List<Object?> get props => [
        remindersRemove,
      ];
}

class EditReminder extends ReminderEvent {
  
  final Reminder reminderEdit;

  EditReminder({required this.reminderEdit});
  
  @override
  List<Object?> get props => [
    reminderEdit
  ];
  
}
