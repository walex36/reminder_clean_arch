import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';

part 'reminder_details_event.dart';
part 'reminder_details_state.dart';

class ReminderDetailsBloc
    extends Bloc<ReminderDetailsEvent, ReminderDetailsState> {
  ReminderDetailsBloc()
      : super(ReminderDetailsState(
          reminder: Reminder(
              codigoReminder: 0,
              codigoCategory: 0,
              titleReminder: '',
              bodyReminder: '',
              backgroudReminder: Colors.grey.shade300),
        )) {
    on<InitReminderDetails>(_onInitReminderDetails);
    on<ChangeTitleReminder>(_onChangeTitleReminder);
    on<ChangeBodyReminder>(_onChangeBodyReminder);
    on<ChangeColorReminder>(_onChangeColorReminder);
  }

  Future<void> _onInitReminderDetails(
      InitReminderDetails event, Emitter<ReminderDetailsState> emit) async {
    emit(state.copyWith(reminder: event.reminder));
  }

  Future<void> _onChangeTitleReminder(
      ChangeTitleReminder event, Emitter<ReminderDetailsState> emit) async {
    Reminder reminder =
        state.reminder.copyWith(titleReminder: event.titleReminder);

    emit(state.copyWith(reminder: reminder, updateList: true));
  }

  Future<void> _onChangeBodyReminder(
      ChangeBodyReminder event, Emitter<ReminderDetailsState> emit) async {
    Reminder reminder =
        state.reminder.copyWith(bodyReminder: event.bodyReminder);

    emit(state.copyWith(reminder: reminder, updateList: true));
  }

  Future<void> _onChangeColorReminder(
      ChangeColorReminder event, Emitter<ReminderDetailsState> emit) async {
    Reminder reminder =
        state.reminder.copyWith(backgroudReminder: event.colorReminder);

    emit(state.copyWith(reminder: reminder, updateList: true));
  }
}
