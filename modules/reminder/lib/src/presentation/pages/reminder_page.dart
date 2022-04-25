import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:reminder/src/presentation/controller/reminder_bloc.dart';
import 'package:reminder/src/presentation/widgets/reminder_add_widget.dart';
import 'package:reminder/src/presentation/widgets/reminder_grid_widget.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {

  final ReminderBloc reminderBloc = Modular.get();

  @override
  void initState() {
    super.initState();
    reminderBloc.add(InitReminder());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder Title'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) => const ReminderAddWidget(),
          );
        },
      ),
      body: BlocBuilder<ReminderBloc, ReminderState>(
        bloc: reminderBloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.empty:
            return const Text("empty");
            case ControlStatus.initial:
            return const Text("initial");
            case ControlStatus.loading:
            return const Text("loading");
            case ControlStatus.failure:
              return const Text("Error");
            case ControlStatus.success:
              return ReminderGridWidget(reminders: state.reminders,);
            default:
            return const Text("default");
          }
        },
      )
    );
  }
}
