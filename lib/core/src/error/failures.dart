import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure({this.message = ''});

  @override
  List<Object?> get props => [message];
}

class SearchReminderFromCodigoFailure extends IFailure {
  const SearchReminderFromCodigoFailure({
    String message = 'Lembrete não encontrado',
  }) : super(message: message);
}

class AllReminderFailure extends IFailure {
  const AllReminderFailure({
    String message = 'Problema ao buscar Lista de Lembretes',
  }) : super(message: message);
}

class SetReminderFailure extends IFailure {
  const SetReminderFailure({
    String message = 'Problema ao salvar Lista de Lembretes',
  }) : super(message: message);
}
