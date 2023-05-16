import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';

part 'reminder_details_event.dart';
part 'reminder_details_state.dart';

class ReminderDetailsBloc
    extends Bloc<ReminderDetailsEvent, ReminderDetailsState> {
  final SetReminderUsecase _setReminderUsecase;

  ReminderDetailsBloc({
    required SetReminderUsecase setReminderUsecase,
  })  : _setReminderUsecase = setReminderUsecase,
        super(ReminderDetailsState(
          reminder: Reminder(
            codigoReminder: 0,
            codigoCategory: 0,
            titleReminder: '',
            bodyReminder: '',
            backgroudReminder: Colors.grey.shade300,
          ),
          status: ControlStatus.empty,
        )) {
    on<InitReminderDetails>(_onInitReminderDetails);
    on<ChangeTitleReminder>(_onChangeTitleReminder);
    on<ChangeBodyReminder>(_onChangeBodyReminder);
    on<ChangeColorReminder>(_onChangeColorReminder);
  }

  Future<void> _onInitReminderDetails(
      InitReminderDetails event, Emitter<ReminderDetailsState> emit) async {
    if (event.reminder != null) {
      emit(state.copyWith(
        status: ControlStatus.success,
        reminder: event.reminder,
      ));
    } else {
      emit(state.copyWith(status: ControlStatus.success));
    }
  }

  Future<void> _onChangeTitleReminder(
      ChangeTitleReminder event, Emitter<ReminderDetailsState> emit) async {
    Reminder reminder =
        state.reminder.copyWith(titleReminder: event.titleReminder);

    _saveReminder(reminder: reminder);
    emit(state.copyWith(reminder: reminder));
  }

  Future<void> _onChangeBodyReminder(
      ChangeBodyReminder event, Emitter<ReminderDetailsState> emit) async {
    Reminder reminder =
        state.reminder.copyWith(bodyReminder: event.bodyReminder);

    _saveReminder(reminder: reminder);
    emit(state.copyWith(reminder: reminder));
  }

  Future<void> _onChangeColorReminder(
      ChangeColorReminder event, Emitter<ReminderDetailsState> emit) async {
    Reminder reminder =
        state.reminder.copyWith(backgroudReminder: event.colorReminder);

    _saveReminder(reminder: reminder);
    emit(state.copyWith(reminder: reminder));
  }

  Future<void> _saveReminder({
    required Reminder reminder,
  }) async {
    var failureOrSave = await _setReminderUsecase(
      ParamsSetReminderUsecase(reminder: reminder),
    );

    failureOrSave.fold(
      (failure) => print(failure),
      (save) => print(save),
    );
  }
}
