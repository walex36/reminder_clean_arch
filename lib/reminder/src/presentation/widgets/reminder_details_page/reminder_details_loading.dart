import 'package:flutter/material.dart';

class ReminderDetailsLoading extends StatefulWidget {
  const ReminderDetailsLoading({Key? key}) : super(key: key);

  @override
  State<ReminderDetailsLoading> createState() => _ReminderDetailsLoadingState();
}

class _ReminderDetailsLoadingState extends State<ReminderDetailsLoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
