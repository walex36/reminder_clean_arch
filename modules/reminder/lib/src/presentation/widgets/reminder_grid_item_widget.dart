import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:reminder/src/presentation/controller/reminder_details/reminder_details_bloc.dart';
import '../controller/reminder_page.dart/reminder_bloc.dart';

class CardReminderWidget extends StatelessWidget {
  final Reminder _reminder;

  final ReminderBloc reminderBloc = Modular.get();
  final ReminderDetailsBloc reminderDetailsBloc = Modular.get();

  CardReminderWidget({Key? key, required Reminder reminder})
      : _reminder = reminder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: reminderBloc.state.remindersSelect.contains(_reminder)
          ? Colors.black38
          : _reminder.backgroudReminder,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => reminderBloc.state.remindersSelect.isNotEmpty
            ? reminderBloc.add(SelectReminder(reminderSelect: _reminder))
            : {
                reminderDetailsBloc
                    .add(InitReminderDetails(reminder: _reminder)),
                Modular.to.pushNamed('reminderdetails'),
              },
        onLongPress: () =>
            reminderBloc.add(SelectReminder(reminderSelect: _reminder)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                    _reminder.titleReminder,
                    maxLines: 2,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[850],
                    fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _reminder.bodyReminder,
                maxLines: 5,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[700],
                    fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
