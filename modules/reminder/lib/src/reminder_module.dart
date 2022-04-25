import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:reminder/src/presentation/controller/reminder_bloc.dart';
import 'package:reminder/src/presentation/pages/reminder_page.dart';

class ReminderModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => ReminderBloc(
          getAllReminderUsercase: i(),
          setReminderListUsecase: i(),
        )),
    Bind((i) => GetAllReminderUsecase(reminderRepository: i())),
    Bind((i) => SetReminderListUsecase(reminderRepository: i())),
    Bind<IReminderRepository>(
        (i) => ReminderRepository(reminderLocalDatasource: i())),
    Bind<IReminderLocalDatasource>(
        (i) => ReminderSembastDatasource(localDataBase: i())),
    Bind<IReminderDatabase>((i) => ReminderDatabase.intance)
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const ReminderPage(),
    ),
  ];
}
