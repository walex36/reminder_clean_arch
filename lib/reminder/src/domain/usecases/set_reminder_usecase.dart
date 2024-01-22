import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

class SetReminderUsecase implements UseCase<bool, ParamsSetReminderUsecase> {
  final IReminderRepository _reminderRepository;

  SetReminderUsecase({
    required IReminderRepository reminderRepository,
  }) : _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, bool>> call(ParamsSetReminderUsecase params) async {
    return await _reminderRepository.setReminder(reminder: params.reminder);
  }
}

class ParamsSetReminderUsecase {
  final Reminder reminder;

  ParamsSetReminderUsecase({required this.reminder});
}
