import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:meta/meta.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final GetAllReminderUsecase _getAllReminderUsercase;
  final SetReminderListUsecase _setReminderListUsecase;

  ReminderBloc({
    required GetAllReminderUsecase getAllReminderUsercase,
    required SetReminderListUsecase setReminderListUsecase,
  })  : _getAllReminderUsercase = getAllReminderUsercase,
        _setReminderListUsecase = setReminderListUsecase,
        super(
          const ReminderState(reminders: [], status: ControlStatus.empty),
        ) {
    on<CreateReminder>(_onCreateReminder);
    on<InitReminder>(_onInitReminder);
    on<RemoveReminder>(_onRemoveReminder);
  }

  Future<void> _onCreateReminder(
    CreateReminder event,
    Emitter<ReminderState> emit,
  ) async {
    List<Reminder> reminders = [];

    reminders.addAll(state.reminders);

    int codigoProximoReminder = 1;

    if (state.reminders.isNotEmpty) {
      codigoProximoReminder = state.reminders.last.codigoReminder + 1;
    }

    Reminder newReminder = Reminder(
        codigoReminder: codigoProximoReminder,
        titleReminder: event.titleReminder,
        bodyReminder: event.bodyReminder);

    reminders.add(newReminder);

    _setReminderListUsecase(ParamsSetReminderListUsecase(reminders: reminders));

    emit(state.copyWith(reminders: reminders, status: ControlStatus.success));
  }

  Future<void> _onInitReminder(
    InitReminder event,
    Emitter<ReminderState> emit,
  ) async {
    
    emit(state.copyWith(status: ControlStatus.loading));

    final failureOrSuccess =
        await _getAllReminderUsercase(ParamsGetAllReminderUseCase());

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(reminders: [], status: ControlStatus.failure)),
      (success) => emit(state.copyWith(reminders: success, status: ControlStatus.success)),
    );
  }

  Future<void> _onRemoveReminder(RemoveReminder event, Emitter<ReminderState> emit) async {

    List<Reminder> reminders = [];

    for (var r in state.reminders) {
      if (event.remindersRemove.contains(r)) {
        reminders.add(r);
      }
    }

    _setReminderListUsecase(ParamsSetReminderListUsecase(reminders: reminders));

    emit(state.copyWith(reminders: reminders));
    // TODO: implementar essa função na page
  }
}
