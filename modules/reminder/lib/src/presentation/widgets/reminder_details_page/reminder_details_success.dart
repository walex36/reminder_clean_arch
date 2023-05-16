import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_design_system/lib_design_system.dart';
import 'package:reminder/src/presentation/controller/reminder_details/reminder_details_bloc.dart';
import 'package:reminder/src/presentation/controller/reminder_page.dart/reminder_bloc.dart';

class ReminderDetailsSuccess extends StatefulWidget {
  final String title;
  final String body;
  const ReminderDetailsSuccess({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  State<ReminderDetailsSuccess> createState() => _ReminderDetailsSuccessState();
}

class _ReminderDetailsSuccessState extends State<ReminderDetailsSuccess> {
  final ReminderDetailsBloc bloc = Modular.get();
  final ReminderBloc blocListReminder = Modular.get();

  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _bodyController = TextEditingController(text: widget.body);
  }

  @override
  void dispose() {
    blocListReminder.add(InitReminder());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return BlocBuilder<ReminderDetailsBloc, ReminderDetailsState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.reminder.backgroudReminder,
            appBar: const AppbarWidget(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: SizedBox(
                  height: 55,
                  child: ListColorsReminders(
                    colorSelect: state.reminder.backgroudReminder,
                    colorOnTap: (color) async {
                      bloc.add(ChangeColorReminder(colorReminder: color));
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
                        onChanged: (_) => bloc.add(ChangeTitleReminder(
                          titleReminder: _titleController.text,
                        )),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Título',
                        ),
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
                      SizedBox(
                        height: sizeScreen.height - 260,
                        child: TextField(
                          controller: _bodyController,
                          expands: true,
                          onChanged: (_) => bloc.add(ChangeBodyReminder(
                            bodyReminder: _bodyController.text,
                          )),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Descrição',
                          ),
                          minLines: null,
                          maxLines: null,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
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
