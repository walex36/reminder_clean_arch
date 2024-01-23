import 'package:reminder_clean_arch/category/src/data/datasources/i_category_local_datasource.dart';
import 'package:reminder_clean_arch/category/src/data/models/category_model.dart';
import 'package:reminder_clean_arch/category/src/database/i_category_database.dart';
import 'package:reminder_clean_arch/core/core.dart';

class CategorySembastDatasource implements ICategoryLocalDatasource {
  final ICategoryDatabase _database;

  CategorySembastDatasource({required ICategoryDatabase database})
      : _database = database;
  @override
  Future<bool> deleteCategory({required int codigoCategory}) async {
    try {
      final result =
          await _database.deleteCategory(codigoCategory: codigoCategory);

      return result;
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<List<CategoryModel>> getCategorys() async {
    try {
      final result = await _database.getListaCategorys();

      return result;
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<bool> setCategory({required CategoryModel category}) async {
    try {
      final result = await _database.storeCategory(category: category);

      return result;
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }
}
