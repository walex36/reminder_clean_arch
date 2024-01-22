import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

class GetReminderUseCase
    implements UseCase<Reminder, ParamsGetReminderUseCase> {
  final IReminderRepository _reminderRepository;

  GetReminderUseCase({
    required reminderRepository,
  }) : _reminderRepository = reminderRepository;

  @override
  Future<Either<IFailure, Reminder>> call(params) async {
    return await _reminderRepository.getReminder(
      codigoReminder: params.codigoReminder,
    );
  }
}

class ParamsGetReminderUseCase {
  final int codigoReminder;

  ParamsGetReminderUseCase({required this.codigoReminder});
}
