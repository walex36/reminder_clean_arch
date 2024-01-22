import 'package:flutter/material.dart';

class ReminderPageLoading extends StatelessWidget {
  const ReminderPageLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}