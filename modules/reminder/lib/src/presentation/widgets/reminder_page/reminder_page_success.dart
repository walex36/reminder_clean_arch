import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:reminder/src/presentation/widgets/reminder_grid_widget.dart';

import '../../controller/reminder_page.dart/reminder_bloc.dart';

class ReminderPageSuccess extends StatefulWidget {
  const ReminderPageSuccess({Key? key}) : super(key: key);

  @override
  State<ReminderPageSuccess> createState() => _ReminderPageSuccessState();
}

class _ReminderPageSuccessState extends State<ReminderPageSuccess> {
  final ReminderBloc bloc = Modular.get();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderBloc, ReminderState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: state.remindersSelect.isEmpty
              ? FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () =>
                      Modular.get<ReminderBloc>().add(CreateReminder(
                    codigoReminder: 0,
                    codigoCategory: 0,
                    titleReminder: '',
                    bodyReminder: '',
                    backgroudReminder: Colors.grey.shade300,
                    openReminder: true,
                  )),
                )
              : FloatingActionButton(
                  child: const Icon(Icons.delete),
                  backgroundColor: Colors.redAccent,
                  onPressed: () => bloc.add(RemoveReminder()),
                ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReminderGridWidget(reminders: state.reminders),
              ),
            ],
          ),
        );
      },
    );
  }
}
