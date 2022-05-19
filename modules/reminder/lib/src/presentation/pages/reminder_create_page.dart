import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_design_system/lib_design_system.dart';
import '../controller/reminder_page.dart/reminder_bloc.dart';

class ReminderCreatePage extends StatefulWidget {
  const ReminderCreatePage({Key? key}) : super(key: key);

  @override
  State<ReminderCreatePage> createState() => _ReminderCreatePageState();
}

class _ReminderCreatePageState extends State<ReminderCreatePage> {
  final ReminderBloc reminderBloc = Modular.get();

  TextEditingController titleReminderController = TextEditingController();

  TextEditingController bodyReminderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Create Reminder',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.maxFinite,
        child: ElevatedButton(
          child: const Text('Create Reminder'),
          onPressed: () {
            reminderBloc.add(
              CreateReminder(
                codigoReminder: 0,
                codigoCategory: 0,
                titleReminder: titleReminderController.text,
                bodyReminder: bodyReminderController.text,
                backgroudReminder: Colors.grey.shade300,
              ),
            );
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: titleReminderController,
                  minLines: 1,
                  maxLines: null,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title Reminder',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: bodyReminderController,
                  minLines: 4,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'body Reminder',
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
