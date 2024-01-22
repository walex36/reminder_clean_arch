import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

class GetAllReminderUsecase
    implements UseCase<List<Reminder>, ParamsGetAllReminderUseCase> {
  final IReminderRepository _reminderRepository;
  GetAllReminderUsecase({
    required IReminderRepository reminderRepository,
  }) : _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, List<Reminder>>> call(
      ParamsGetAllReminderUseCase params) async {
    return await _reminderRepository.getAllReminder();
  }
}

class ParamsGetAllReminderUseCase {}
