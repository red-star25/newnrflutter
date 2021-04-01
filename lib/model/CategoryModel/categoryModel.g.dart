// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    categoryName: json['categoryName'] as String,
    id: json['id'] as String,
    isSelected: json['isSelected'] as bool,
  )..categoryImage = json['categoryImage'] as String;
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'isSelected': instance.isSelected,
      'categoryImage': instance.categoryImage,
    };
