import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/src/domain/entities/reminder_entity.dart';

abstract class IReminderRepository {
  Future<Either<IFailure, Reminder>> getReminder({
    required int codigoReminder,
  });

  Future<Either<IFailure, List<Reminder>>> getAllReminder();

  Future<Either<IFailure, bool>> setReminder({
    required Reminder reminder,
  });

  Future<Either<IFailure, bool>> setReminderList(
      {required List<Reminder> reminders});
}
