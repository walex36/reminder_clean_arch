import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:reminder/src/presentation/controller/reminder_details/reminder_details_bloc.dart';
import 'package:reminder/src/presentation/controller/reminder_page.dart/reminder_bloc.dart';
import 'package:reminder/src/presentation/widgets/reminder_details_page/reminder_details_loading.dart';
import 'package:reminder/src/presentation/widgets/reminder_details_page/reminder_details_success.dart';

class ReminderDetailsPage extends StatefulWidget {
  final Reminder? reminder;
  const ReminderDetailsPage({
    Key? key,
    required this.reminder,
  }) : super(key: key);

  @override
  State<ReminderDetailsPage> createState() => _ReminderDetailsPageState();
}

class _ReminderDetailsPageState extends State<ReminderDetailsPage> {
  final ReminderDetailsBloc blocDetails = Modular.get();
  final ReminderBloc reminderBloc = Modular.get();

  @override
  void initState() {
    super.initState();
    blocDetails.add(InitReminderDetails(reminder: widget.reminder));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderDetailsBloc, ReminderDetailsState>(
      bloc: blocDetails,
      builder: (context, state) {
        switch (state.status) {
          case ControlStatus.empty:
          case ControlStatus.initial:
          case ControlStatus.loading:
            return const ReminderDetailsLoading();
          case ControlStatus.failure:
          case ControlStatus.success:
            return ReminderDetailsSuccess(
              title:
                  widget.reminder != null ? widget.reminder!.titleReminder : '',
              body:
                  widget.reminder != null ? widget.reminder!.bodyReminder : '',
            );
          default:
            return const Text("default");
        }
      },
    );
  }
}
