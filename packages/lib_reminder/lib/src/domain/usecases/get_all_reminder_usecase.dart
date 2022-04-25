import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:lib_reminder/src/domain/repositories/i_reminder_repository.dart';

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
