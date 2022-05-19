import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final GetAllReminderUsecase _getAllReminderUsercase;
  final SetReminderListUsecase _setReminderListUsecase;
  final SetReminderUsecase _setReminderUsecase;

  ReminderBloc({
    required GetAllReminderUsecase getAllReminderUsercase,
    required SetReminderListUsecase setReminderListUsecase,
    required SetReminderUsecase setReminderUsecase,
  })  : _getAllReminderUsercase = getAllReminderUsercase,
        _setReminderListUsecase = setReminderListUsecase,
        _setReminderUsecase = setReminderUsecase,
        super(
          const ReminderState(
            reminders: [],
            status: ControlStatus.empty,
            remindersSelect: [],
          ),
        ) {
    on<InitReminder>(_onInitReminder);
    on<CreateReminder>(_onCreateReminder);
    on<UpdateReminder>(_onUpdateReminder);
    on<RemoveReminder>(_onRemoveReminder);
    on<SelectReminder>(_onSelectReminder);
  }

  Future<void> _onInitReminder(
    InitReminder event,
    Emitter<ReminderState> emit,
  ) async {
    emit(state.copyWith(status: ControlStatus.loading));

    final failureOrSuccess =
        await _getAllReminderUsercase(ParamsGetAllReminderUseCase());

    failureOrSuccess.fold(
        (failure) => emit(state.copyWith(
              reminders: [],
              status: ControlStatus.failure,
            )), (success) {
      if (success.isEmpty) {
        emit(state.copyWith(
          reminders: success,
          status: ControlStatus.empty,
        ));
      } else {
        emit(state.copyWith(
          reminders: success,
          status: ControlStatus.success,
        ));
      }
    });
  }

  Future<void> _onCreateReminder(
    CreateReminder event,
    Emitter<ReminderState> emit,
  ) async {
    int codigoProximoReminder = 1;

    if (state.reminders.isNotEmpty) {
      codigoProximoReminder = state.reminders.last.codigoReminder + 1;
    }

    Reminder newReminder = Reminder(
        codigoReminder: codigoProximoReminder,
        codigoCategory: event.codigoCategory,
        titleReminder: event.titleReminder,
        bodyReminder: event.bodyReminder,
        backgroudReminder: event.backgroudReminder);

    _setReminderUsecase(ParamsSetReminderUsecase(reminder: newReminder));

    List<Reminder> listReminders = [];
    listReminders.addAll(state.reminders);
    listReminders.add(newReminder);

    emit(state.copyWith(
        reminders: listReminders, status: ControlStatus.success));
  }

  Future<void> _onUpdateReminder(
    UpdateReminder event,
    Emitter<ReminderState> emit,
  ) async {
    final failureOrSuccess = await _setReminderUsecase(
        ParamsSetReminderUsecase(reminder: event.reminder));

    await failureOrSuccess.fold(
      (failure) => null,
      (success) async {
        await _onInitReminder(InitReminder(), emit);
      },
    );
  }

  Future<void> _onSelectReminder(
      SelectReminder event, Emitter<ReminderState> emit) async {
    List<Reminder> reminders = [];
    reminders.addAll(state.remindersSelect);

    reminders.contains(event.reminderSelect)
        ? reminders.remove(event.reminderSelect)
        : reminders.add(event.reminderSelect);

    emit(state.copyWith(remindersSelect: reminders));
  }

  Future<void> _onRemoveReminder(
      RemoveReminder event, Emitter<ReminderState> emit) async {
    List<Reminder> reminders = [];
    reminders.addAll(state.reminders);

    for (var r in state.remindersSelect) {
      reminders.remove(r);
    }

    _setReminderListUsecase(ParamsSetReminderListUsecase(reminders: reminders));

    emit(state.copyWith(reminders: reminders, remindersSelect: []));
  }
}
