import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_reminder/lib_reminder.dart';
import '../controller/reminder_page.dart/reminder_bloc.dart';

class CardReminderWidget extends StatelessWidget {
  final Reminder reminder;

  final ReminderBloc reminderBloc = Modular.get();

  CardReminderWidget({
    Key? key,
    required this.reminder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: reminderBloc.state.remindersSelect.contains(reminder)
          ? Colors.black38
          : reminder.backgroudReminder,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => reminderBloc.state.remindersSelect.isNotEmpty
            ? reminderBloc.add(SelectReminder(reminderSelect: reminder))
            : {
                Modular.to.pushNamed(
                  'reminderdetails',
                  arguments: {
                    'reminder': reminder,
                  },
                ),
              },
        onLongPress: () => reminderBloc.add(
          SelectReminder(reminderSelect: reminder),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reminder.titleReminder,
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
                reminder.bodyReminder,
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
