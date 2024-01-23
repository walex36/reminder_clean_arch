import 'dart:convert';

import 'package:reminder_clean_arch/category/src/domain/domain.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required int codigoCategory,
    required String titleCategory,
    required int position,
  }) : super(
          codigoCategory: codigoCategory,
          titleCategory: titleCategory,
          position: position,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigoCategory': codigoCategory,
      'titleCategory': titleCategory,
      'position': position,
    };
  }

  Category toEntity() {
    return Category(
      codigoCategory: codigoCategory,
      titleCategory: titleCategory,
      position: position,
    );
  }

  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      codigoCategory: category.codigoCategory,
      titleCategory: category.titleCategory,
      position: category.position,
    );
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      codigoCategory: map['codigoCategory'] as int,
      titleCategory: map['titleCategory'] as String,
      position: map['position'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
