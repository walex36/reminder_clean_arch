import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_core/lib_core.dart';
import 'package:reminder/reminder.dart';

class AppModule extends Module {
  static String get initialRoute => RoutesConst.home;
  
  @override
  final List<Bind<Object>> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      RoutesConst.home,
      module: ReminderModule(),
    ),
  ];
}