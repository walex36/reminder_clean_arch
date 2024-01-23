import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

abstract class IReminderRepository {
  Future<Either<IFailure, List<Reminder>>> getReminders();

  Future<Either<IFailure, bool>> setReminder({
    required Reminder reminder,
  });

  Future<Either<IFailure, bool>> deleteReminder({
    required int codigoReminder,
  });
}
