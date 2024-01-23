import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

class GetRemindersUsecase
    implements UseCase<List<Reminder>, ParamsGetRemindersUseCase> {
  final IReminderRepository _reminderRepository;
  GetRemindersUsecase({
    required IReminderRepository reminderRepository,
  }) : _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, List<Reminder>>> call(
      ParamsGetRemindersUseCase params) async {
    return await _reminderRepository.getReminders();
  }
}

class ParamsGetRemindersUseCase {}
