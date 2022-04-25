import 'package:flutter/material.dart';
import 'package:reminder/src/presentation/controller/reminder_bloc.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class ReminderAddWidget extends StatefulWidget {
  const ReminderAddWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ReminderAddWidget> createState() => _ReminderAddWidgetState();
}

class _ReminderAddWidgetState extends State<ReminderAddWidget> {
  final ReminderBloc reminderBloc = Modular.get();

  TextEditingController titleReminderController = TextEditingController();
  TextEditingController bodyReminderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            const Text(
              'Create Reminder',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Color.fromARGB(255, 52, 52, 52)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleReminderController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title Reminder'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: bodyReminderController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Text Reminder'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      child: const Text('Create'),
                      onPressed: () {
                        reminderBloc.add(
                          CreateReminder(
                            codigoReminder: 0,
                            titleReminder: titleReminderController.text,
                            bodyReminder: bodyReminderController.text,
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
