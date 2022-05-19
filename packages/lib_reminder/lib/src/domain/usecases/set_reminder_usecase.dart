import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_reminder/lib_reminder.dart';

class SetReminderUsecase
    implements UseCase<bool, ParamsSetReminderUsecase> {
  final IReminderRepository _reminderRepository;

  SetReminderUsecase({
    required IReminderRepository reminderRepository,
  }) : _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, bool>> call(
      ParamsSetReminderUsecase params) async {
    return await _reminderRepository.setReminder(
        reminder: params.reminder);
  }
}

class ParamsSetReminderUsecase {
  final Reminder reminder;

  ParamsSetReminderUsecase({required this.reminder});
}
