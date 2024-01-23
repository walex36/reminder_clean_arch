import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/category/src/domain/domain.dart';
import 'package:reminder_clean_arch/core/core.dart';

class DeleteCategoryUsecase implements UseCase<bool, ParamsDeleteCategory> {
  final ICategoryRepository _categoryRepository;
  DeleteCategoryUsecase({
    required ICategoryRepository reminderRepository,
  }) : _categoryRepository = reminderRepository;

  @override
  Future<Either<IFailure, bool>> call(ParamsDeleteCategory params) {
    return _categoryRepository.deleteCategory(
      codigoCategory: params.codigoCategory,
    );
  }
}

class ParamsDeleteCategory {
  final int codigoCategory;
  ParamsDeleteCategory({required this.codigoCategory});
}
