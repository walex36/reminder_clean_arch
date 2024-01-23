import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

class DeleteReminderUsecase implements UseCase<bool, ParamsDeleteReminder> {
  final IReminderRepository _reminderRepository;
  DeleteReminderUsecase({
    required IReminderRepository reminderRepository,
  }) : _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, bool>> call(ParamsDeleteReminder params) {
    return _reminderRepository.deleteReminder(
      codigoReminder: params.codigoReminder,
    );
  }
}

class ParamsDeleteReminder {
  final int codigoReminder;
  ParamsDeleteReminder({required this.codigoReminder});
}
