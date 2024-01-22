import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

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
