
import 'package:lib_dependencies/lib_dependencies.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure({this.message = ''});


}