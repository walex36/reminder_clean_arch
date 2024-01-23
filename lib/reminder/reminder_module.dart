import 'package:flutter_modular/flutter_modular.dart';
import 'package:reminder_clean_arch/reminder/src/data/data.dart';
import 'package:reminder_clean_arch/reminder/src/database/database.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';
import 'package:reminder_clean_arch/reminder/src/domain/usecases/delete_reminder_usecase.dart';
import 'package:reminder_clean_arch/reminder/src/presentation/presentation.dart';

class ReminderModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind(
      (i) => ReminderBloc(
        getRemindersUsecase: i(),
        setReminderUsecase: i(),
        deleteReminderUsecase: i(),
      ),
    ),
    Bind((i) => ReminderDetailsBloc(setReminderUsecase: i())),
    Bind((i) => GetRemindersUsecase(reminderRepository: i())),
    Bind((i) => DeleteReminderUsecase(reminderRepository: i())),
    Bind((i) => SetReminderUsecase(reminderRepository: i())),
    Bind<IReminderRepository>(
      (i) => ReminderRepository(reminderLocalDatasource: i()),
    ),
    Bind<IReminderLocalDatasource>(
      (i) => ReminderSembastDatasource(localDataBase: i()),
    ),
    Bind<IReminderDatabase>((i) => ReminderDatabase())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const ReminderPage(),
    ),
    ChildRoute(
      '/reminderdetails',
      maintainState: false,
      child: (context, args) =>
          ReminderDetailsPage(reminder: args.data['reminder']),
    ),
  ];
}
