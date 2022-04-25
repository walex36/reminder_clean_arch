import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:reminder/src/presentation/controller/reminder_bloc.dart';
import 'package:reminder/src/presentation/widgets/card_reminder_widget.dart';

class ReminderGridWidget extends StatefulWidget {
  final List<Reminder> _reminders;
  const ReminderGridWidget({
    Key? key,
    required List<Reminder> reminders,
  })  : _reminders = reminders,
        super(key: key);

  @override
  State<ReminderGridWidget> createState() => _ReminderGridWidgetState();
}

class _ReminderGridWidgetState extends State<ReminderGridWidget> {
  final ReminderBloc reminderBloc = Modular.get();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: widget._reminders
                .map((e) => Column(
                  children: [
                    SizedBox(
                        width: double.maxFinite,
                        child: CardReminderWidget(reminder: e)),
                    // TextButton(
                    //     onPressed: () {
                    //       reminderBloc.add(RemoveReminder(reminder: e));
                    //     },
                    //     child: const Icon(Icons.delete, color: Colors.red,))
                  ],
                ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
