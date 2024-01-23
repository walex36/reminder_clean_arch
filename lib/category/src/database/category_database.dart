import 'package:reminder_clean_arch/category/src/data/models/category_model.dart';
import 'package:reminder_clean_arch/category/src/database/i_category_database.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';

class CategoryDatabase extends ICategoryDatabase {
  @override
  String get storeName => 'category';

  @override
  Future<bool> deleteCategory({required int codigoCategory}) async {
    try {
      final _database = await database;
      final _store = await store;

      final responseToClone = await _store.record(0).get(_database);

      if (responseToClone != null) {
        final Map<String, dynamic> response = cloneMap(responseToClone);

        List<CategoryModel> categoryModelList = List<CategoryModel>.generate(
          response.length,
          (index) => CategoryModel.fromMap(response['$index']),
        );

        final int index = categoryModelList.indexWhere(
            (reminderModel) => reminderModel.codigoCategory == codigoCategory);

        if (index != -1) {
          categoryModelList.removeAt(index);
        } else {
          throw CacheException(message: 'Lembrete inexistente');
        }

        final Map<String, dynamic> reminderMap = <String, dynamic>{};
        final int cachedLenght = categoryModelList.length;

        for (var i = 0; i < cachedLenght; i++) {
          reminderMap['$i'] = categoryModelList[i].toMap();
        }

        await _store.record(0).put(_database, reminderMap);
      }
      return true;
    } catch (e) {
      throw CacheException(message: 'Não foi possivel deletar a categoria');
    }
  }

  @override
  Future<List<CategoryModel>> getListaCategorys() async {
    try {
      final _database = await database;
      final _store = await store;

      final responseToClone = await _store.record(0).get(_database);

      if (responseToClone != null) {
        final Map<String, dynamic> response = cloneMap(responseToClone);

        List<CategoryModel> categoryModelList = List<CategoryModel>.generate(
          response.length,
          (index) => CategoryModel.fromMap(response['$index']),
        );

        return categoryModelList;
      }

      return [];
    } catch (e) {
      throw CacheException(message: 'Não foi possivel buscar as categorias');
    }
  }

  @override
  Future<bool> storeCategory({required CategoryModel category}) async {
    try {
      final _database = await database;
      final _store = await store;

      final responseToClone = await _store.record(0).get(_database);

      if (responseToClone != null) {
        final Map<String, dynamic> response = cloneMap(responseToClone);

        List<CategoryModel> categoryModelList = List<CategoryModel>.generate(
          response.length,
          (index) => CategoryModel.fromMap(response['$index']),
        );

        final int index = categoryModelList.indexWhere((reminderModel) =>
            reminderModel.codigoCategory == category.codigoCategory);

        if (index == -1) {
          categoryModelList.add(category);
        } else {
          categoryModelList[index] = category;
        }

        final Map<String, dynamic> reminderMap = <String, dynamic>{};
        final int cachedLenght = categoryModelList.length;

        for (var i = 0; i < cachedLenght; i++) {
          reminderMap['$i'] = categoryModelList[i].toMap();
        }

        await _store.record(0).put(_database, reminderMap);
      } else {
        final Map<String, dynamic> reminderMap = <String, dynamic>{};
        reminderMap['0'] = category.toMap();
        await _store.record(0).put(_database, reminderMap);
      }

      return true;
    } catch (e) {
      throw CacheException(message: 'Não foi possivel salvar a categoria');
    }
  }
}
