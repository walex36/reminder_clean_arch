import 'package:reminder_clean_arch/category/src/data/data.dart';
import 'package:reminder_clean_arch/core/core.dart';

abstract class ICategoryDatabase extends IIntNoSQLDatabase {
  Future<bool> deleteCategory({
    required int codigoCategory,
  });

  Future<List<CategoryModel>> getListaCategorys();

  Future<bool> storeCategory({
    required CategoryModel category,
  });
}
