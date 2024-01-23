import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';
import 'package:reminder_clean_arch/reminder/src/domain/usecases/delete_reminder_usecase.dart';
part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final GetRemindersUsecase _getRemindersUsecase;
  final SetReminderUsecase _setReminderUsecase;
  final DeleteReminderUsecase _deleteReminderUsecase;

  ReminderBloc({
    required GetRemindersUsecase getRemindersUsecase,
    required SetReminderUsecase setReminderUsecase,
    required DeleteReminderUsecase deleteReminderUsecase,
  })  : _getRemindersUsecase = getRemindersUsecase,
        _setReminderUsecase = setReminderUsecase,
        _deleteReminderUsecase = deleteReminderUsecase,
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
        await _getRemindersUsecase(ParamsGetRemindersUseCase());

    failureOrSuccess.fold(
      (failure) => emit(
        state.copyWith(
          reminders: [],
          status: ControlStatus.failure,
        ),
      ),
      (success) {
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
      },
    );
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

    if (event.openReminder) {
      Modular.to.pushNamed('reminderdetails', arguments: {
        'reminder': newReminder,
      });
    }
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
      await _deleteReminderUsecase(ParamsDeleteReminder(
        codigoReminder: r.codigoReminder,
      ));
    }

    emit(state.copyWith(reminders: reminders, remindersSelect: []));
  }
}
