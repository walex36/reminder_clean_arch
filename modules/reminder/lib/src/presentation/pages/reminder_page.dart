import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_design_system/lib_design_system.dart';
import 'package:reminder/src/presentation/widgets/reminder_page/reminder_page_success.dart';
import '../widgets/reminder_page/reminder_page_empty.dart';
import '../widgets/reminder_page/reminder_page_failure.dart';
import '../widgets/reminder_page/reminder_page_loading.dart';
import '../controller/reminder_page.dart/reminder_bloc.dart';
import '../widgets/reminder_grid_widget.dart';

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
      appBar: const AppbarWidget(
        title: 'Meus Lembretes',
      ),
      body: BlocBuilder<ReminderBloc, ReminderState>(
        bloc: reminderBloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.empty:
              return const ReminderPageEmpty();
            case ControlStatus.initial:
              return const Text("initial");
            case ControlStatus.loading:
              return const ReminderPageLoading();
            case ControlStatus.failure:
              return const ReminderPageFailure();
            case ControlStatus.success:
              return const ReminderPageSuccess();
            default:
              return const Text("default");
          }
        },
      ),
    );
  }
}
