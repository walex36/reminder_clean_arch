import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';
import '../presentation.dart';
import '../widgets/reminder_details_page/reminder_details_loading.dart';
import '../widgets/reminder_details_page/reminder_details_success.dart';

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
