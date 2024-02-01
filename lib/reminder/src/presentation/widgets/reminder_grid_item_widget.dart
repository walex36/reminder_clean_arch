import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';
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
    final isDelectActive = reminderBloc.state.remindersSelect.isNotEmpty;
    final isSelected = reminderBloc.state.remindersSelect.contains(reminder);

    return Card(
      color: reminder.backgroudReminder,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => isDelectActive
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reminder.titleReminder,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
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
            Visibility(
              visible: isSelected,
              child: Positioned(
                bottom: 0,
                right: 0,
                top: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.red.shade600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
