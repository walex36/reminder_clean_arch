import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? _title;
  const AppbarWidget({ Key? key, String? title }) : _title = title ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title ?? '', style: const TextStyle(color: Colors.black),),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      iconTheme: const IconThemeData(
        color: Colors.black
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}