import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_design_system/lib_design_system.dart';
import 'package:reminder/src/presentation/controller/reminder_details/reminder_details_bloc.dart';
import 'package:reminder/src/presentation/controller/reminder_page.dart/reminder_bloc.dart';

class ReminderDetailsPage extends StatefulWidget {
  const ReminderDetailsPage({Key? key}) : super(key: key);

  @override
  State<ReminderDetailsPage> createState() => _ReminderDetailsPageState();
}

class _ReminderDetailsPageState extends State<ReminderDetailsPage> {
  ReminderDetailsBloc blocDetails = Modular.get();
  ReminderBloc blocList = Modular.get();

  TextEditingController? _titleController;
  TextEditingController? _bodyController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderDetailsBloc, ReminderDetailsState>(
        bloc: blocDetails,
        builder: (context, state) {
          if (_titleController == null || _bodyController == null) {
            _titleController =
                TextEditingController(text: state.reminder.titleReminder);
            _bodyController =
                TextEditingController(text: state.reminder.bodyReminder);
          }

          return Scaffold(
            backgroundColor: state.reminder.backgroudReminder,
            appBar: const AppbarWidget(),
            floatingActionButton: CircleAvatar(
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.save,
                    color: Colors.orange,
                    size: 30,
                  ),
                  onPressed: () async {
                    blocList.add(UpdateReminder(
                      reminder: state.reminder.copyWith(
                        titleReminder: _titleController!.text,
                        bodyReminder: _bodyController!.text,
                      ),
                    ));
                    Modular.to.pop();
                  },
                ),
                backgroundColor: Colors.grey.shade200,
                radius: 35),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 5),
                child: SizedBox(
                  height: 55,
                  child: ListColorsReminders(
                    colorSelect: state.reminder.backgroudReminder,
                    colorOnTap: (color) async {
                      blocDetails
                          .add(ChangeColorReminder(colorReminder: color));
                    },
                  ),
                ),
              ),
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Title'),
                        maxLines: null,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _bodyController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Body',
                        ),
                        minLines: 10,
                        maxLines: null,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 35),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
