import 'package:reminder_clean_arch/category/src/data/data.dart';

abstract class ICategoryLocalDatasource {
  Future<List<CategoryModel>> getCategorys();
  Future<bool> setCategory({required CategoryModel category});
  Future<bool> deleteCategory({required int codigoCategory});
}
