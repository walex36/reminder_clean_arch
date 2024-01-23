import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dialog_category_event.dart';
part 'dialog_category_state.dart';

class DialogCategoryBloc
    extends Bloc<DialogCategoryEvent, DialogCategoryState> {
  DialogCategoryBloc() : super(DialogCategoryLoading()) {
    on<InitDialogCategory>(_onInitDialogCategory);
  }

  Future<void> _onInitDialogCategory(
    InitDialogCategory event,
    Emitter<DialogCategoryState> emit,
  ) async {}
}
