import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure({this.message = ''});

  @override
  List<Object?> get props => [message];
}

class GetRemindersFailure extends IFailure {
  const GetRemindersFailure({
    String message = 'Erro ao buscar Lista de Lembretes',
  }) : super(message: message);
}

class SetReminderFailure extends IFailure {
  const SetReminderFailure({
    String message = 'Erro ao salvar Lembrete',
  }) : super(message: message);
}

class DeleteReminderFailure extends IFailure {
  const DeleteReminderFailure({
    String message = 'Erro ao deletar Lembrete',
  }) : super(message: message);
}

class DeleteCategoryFailure extends IFailure {
  const DeleteCategoryFailure({
    String message = 'Erro ao deletar Categoria',
  }) : super(message: message);
}

class GetCategorysFailure extends IFailure {
  const GetCategorysFailure({
    String message = 'Erro ao buscar Lista de Categorias',
  }) : super(message: message);
}

class SetCategoryFailure extends IFailure {
  const SetCategoryFailure({
    String message = 'Erro ao salvar Categoria',
  }) : super(message: message);
}
