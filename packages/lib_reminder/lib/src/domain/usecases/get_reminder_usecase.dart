import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_reminder/src/domain/entities/reminder_entity.dart';
import 'package:lib_reminder/src/domain/repositories/i_reminder_repository.dart';

class GetReminderUseCase implements UseCase<Reminder, ParamsGetReminderUseCase> {
  final IReminderRepository _reminderRepository;


  GetReminderUseCase({required reminderRepository,}): _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, Reminder>> call(params) async {
    return await _reminderRepository.getReminder(codigoReminder: params.codigoReminder,);
  }
  }

class ParamsGetReminderUseCase {
  final int codigoReminder;

  ParamsGetReminderUseCase({required this.codigoReminder});
}