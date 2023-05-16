import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:reminder/src/presentation/controller/reminder_page.dart/reminder_bloc.dart';

class ReminderPageEmpty extends StatelessWidget {
  const ReminderPageEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Modular.get<ReminderBloc>().add(CreateReminder(
          codigoReminder: 0,
          codigoCategory: 0,
          titleReminder: '',
          bodyReminder: '',
          backgroudReminder: Colors.grey.shade300,
          openReminder: true,
        )),
      ),
      body: const Center(
        child: Text('Nenhum lembrete criado'),
      ),
    );
  }
}
