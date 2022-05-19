import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_reminder/lib_reminder.dart';

class SetReminderListUsecase
    implements UseCase<bool, ParamsSetReminderListUsecase> {
  final IReminderRepository _reminderRepository;

  SetReminderListUsecase({
    required IReminderRepository reminderRepository,
  }) : _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, bool>> call(
      ParamsSetReminderListUsecase params) async {
    return await _reminderRepository.setReminderList(
        reminders: params.reminders);
  }
}

class ParamsSetReminderListUsecase {
  final List<Reminder> reminders;

  ParamsSetReminderListUsecase({required this.reminders});
}
