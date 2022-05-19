import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class ReminderPageEmpty extends StatelessWidget {
  const ReminderPageEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Modular.to.pushNamed('remindercreate'),
      ),
      body: const Center(
        child: Text('No reminder created'),
      ),
    );
  }
}
