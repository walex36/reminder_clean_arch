import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int codigoCategory;
  final String titleCategory;
  final int position;

  const Category({
    required this.codigoCategory,
    required this.titleCategory,
    required this.position,
  });

  Category copyWith({
    int? codigoCategory,
    String? titleCategory,
    int? position,
  }) {
    return Category(
      codigoCategory: codigoCategory ?? this.codigoCategory,
      titleCategory: titleCategory ?? this.titleCategory,
      position: position ?? this.position,
    );
  }

  @override
  List<Object?> get props => [
        codigoCategory,
        titleCategory,
        position,
      ];
}
