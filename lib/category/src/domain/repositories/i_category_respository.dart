import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/category/src/domain/domain.dart';
import 'package:reminder_clean_arch/core/core.dart';

abstract class ICategoryRepository {
  Future<Either<IFailure, List<Category>>> getCategorys();
  Future<Either<IFailure, bool>> setCategory({required Category category});
  Future<Either<IFailure, bool>> deleteCategory({required int codigoCategory});
}
