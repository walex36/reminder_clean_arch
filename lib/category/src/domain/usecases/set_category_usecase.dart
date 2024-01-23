import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/category/src/domain/domain.dart';
import 'package:reminder_clean_arch/core/core.dart';

class SetCategoryUsecase implements UseCase<bool, ParamsSetCategory> {
  final ICategoryRepository _categoryRepository;

  SetCategoryUsecase({
    required ICategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<Either<IFailure, bool>> call(ParamsSetCategory params) {
    return _categoryRepository.setCategory(category: params.category);
  }
}

class ParamsSetCategory {
  final Category category;
  ParamsSetCategory({required this.category});
}
