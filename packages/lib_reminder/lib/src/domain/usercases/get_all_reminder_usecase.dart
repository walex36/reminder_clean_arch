import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:lib_reminder/src/domain/repositories/i_reminder_repository.dart';

class GetAllReminderUsercase
    implements UseCase<List<Reminder>, ParamsGetAllReminderUseCase> {
  final IReminderRepository _iReminderRepository;
  GetAllReminderUsercase({
    required IReminderRepository iReminderRepository,
  }) : _iReminderRepository = iReminderRepository;

  @override
  Future<Either<IFailure, List<Reminder>>> call(
      ParamsGetAllReminderUseCase params) async {
    return await _iReminderRepository.getAllReminder();
  }
}

class ParamsGetAllReminderUseCase {}
