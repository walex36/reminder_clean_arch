import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reminder_clean_arch/core/core.dart';

abstract class UseCase<type, Params> {
  Future<Either<IFailure, type>> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  Either<IFailure, Type> call(Params params);
}

void voidRight;

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
