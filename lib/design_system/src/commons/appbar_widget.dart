import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const AppbarWidget({
    Key? key,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
