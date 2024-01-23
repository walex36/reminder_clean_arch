import 'package:flutter_modular/flutter_modular.dart';
import 'package:reminder_clean_arch/category/category_module.dart';
import 'package:reminder_clean_arch/core/core.dart';

import 'reminder/reminder_module.dart';

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
    ModuleRoute(
      RoutesConst.category,
      module: CategoryModule(),
    ),
  ];
}
