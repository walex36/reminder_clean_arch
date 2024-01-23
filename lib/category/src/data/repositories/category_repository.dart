import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/category/src/data/data.dart';
import 'package:reminder_clean_arch/category/src/data/datasources/i_category_local_datasource.dart';
import 'package:reminder_clean_arch/category/src/domain/domain.dart';
import 'package:reminder_clean_arch/core/core.dart';

class CategoryRepository implements ICategoryRepository {
  final ICategoryLocalDatasource _categoryLocalDatasource;

  CategoryRepository(
      {required ICategoryLocalDatasource categoryLocalDatasource})
      : _categoryLocalDatasource = categoryLocalDatasource;

  @override
  Future<Either<IFailure, bool>> deleteCategory({
    required int codigoCategory,
  }) async {
    try {
      final failureOrSuccess = await _categoryLocalDatasource.deleteCategory(
        codigoCategory: codigoCategory,
      );

      if (failureOrSuccess) {
        return const Right(true);
      } else {
        return const Left(DeleteCategoryFailure());
      }
    } on CacheException catch (e) {
      return Left(DeleteCategoryFailure(message: e.message));
    }
  }

  @override
  Future<Either<IFailure, List<Category>>> getCategorys() async {
    try {
      final List<CategoryModel> categories =
          await _categoryLocalDatasource.getCategorys();

      return Right(categories.map((e) => e.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(GetCategorysFailure(message: e.message));
    }
  }

  @override
  Future<Either<IFailure, bool>> setCategory({
    required Category category,
  }) async {
    try {
      final failureOrSuccess = await _categoryLocalDatasource.setCategory(
        category: CategoryModel.fromEntity(category),
      );

      if (failureOrSuccess) {
        return const Right(true);
      } else {
        return const Left(SetCategoryFailure());
      }
    } on CacheException catch (e) {
      return Left(SetCategoryFailure(message: e.message));
    }
  }
}
