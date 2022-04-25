import 'package:flutter/material.dart';
import 'package:lib_reminder/lib_reminder.dart';

class CardReminderWidget extends StatelessWidget {
  final Reminder _reminder;

  const CardReminderWidget({Key? key, required Reminder reminder})
      : _reminder = reminder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _reminder.codigoReminder.toString() + " - " + _reminder.titleReminder,
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
    );
  }
}
