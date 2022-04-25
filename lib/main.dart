import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'app_module.dart';
import 'app_widget.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
