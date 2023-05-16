import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_design_system/lib_design_system.dart';
import 'package:lib_reminder/lib_reminder.dart';
import '../controller/reminder_page.dart/reminder_bloc.dart';
import '../widgets/reminder_grid_item_widget.dart';

class ReminderGridWidget extends StatefulWidget {
  final List<Reminder> reminders;
  const ReminderGridWidget({
    Key? key,
    required this.reminders,
  }) : super(key: key);

  @override
  State<ReminderGridWidget> createState() => _ReminderGridWidgetState();
}

class _ReminderGridWidgetState extends State<ReminderGridWidget> {
  final ReminderBloc reminderBloc = Modular.get();

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: widget.reminders
          .map((reminder) => SizedBox(
                width: double.maxFinite,
                child: CardReminderWidget(
                  reminder: reminder,
                ),
              ))
          .toList(),
    );
  }
}
