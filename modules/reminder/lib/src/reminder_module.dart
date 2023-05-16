import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:reminder/src/presentation/controller/reminder_details/reminder_details_bloc.dart';
import 'presentation/controller/reminder_page.dart/reminder_bloc.dart';
import 'presentation/pages/reminder_details_page.dart';
import 'presentation/pages/reminder_page.dart';

class ReminderModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => ReminderBloc(
          getAllReminderUsercase: i(),
          setReminderListUsecase: i(),
          setReminderUsecase: i(),
        )),
    Bind((i) => ReminderDetailsBloc(setReminderUsecase: i())),
    Bind((i) => GetAllReminderUsecase(reminderRepository: i())),
    Bind((i) => SetReminderListUsecase(reminderRepository: i())),
    Bind((i) => SetReminderUsecase(reminderRepository: i())),
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
    ChildRoute(
      '/reminderdetails',
      maintainState: false,
      child: (context, args) =>
          ReminderDetailsPage(reminder: args.data['reminder']),
    ),
  ];
}
