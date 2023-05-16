import 'package:flutter/material.dart';

class ReminderPageFailure extends StatelessWidget {
  const ReminderPageFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Não foi possivel carregar os lembretes'),
    );
  }
}
