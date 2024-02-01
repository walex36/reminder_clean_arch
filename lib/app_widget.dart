import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reminder_clean_arch/app_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      Modular.setInitialRoute(AppModule.initialRoute);

      return MaterialApp.router(
        title: 'Reminder Clean Arch',
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
      );
    });
  }
}
