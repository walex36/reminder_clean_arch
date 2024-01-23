part of 'dialog_category_bloc.dart';

abstract class DialogCategoryState extends Equatable {
  const DialogCategoryState();

  @override
  List<Object> get props => [];
}

class DialogCategoryLoading extends DialogCategoryState {}

class DialogCategorySuccess extends DialogCategoryState {}
