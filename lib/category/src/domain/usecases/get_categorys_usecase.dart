import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/category/src/domain/domain.dart';
import 'package:reminder_clean_arch/core/core.dart';

class GetCategorysUsecase implements UseCase<List<Category>, NoParams> {
  final ICategoryRepository _categoryRepository;

  GetCategorysUsecase({
    required ICategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<Either<IFailure, List<Category>>> call(NoParams params) {
    return _categoryRepository.getCategorys();
  }
}
