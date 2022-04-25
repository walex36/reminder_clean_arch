
import 'package:lib_core/src/error/failures.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

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