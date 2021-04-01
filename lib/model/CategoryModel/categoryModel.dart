import 'package:json_annotation/json_annotation.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

part 'categoryModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel {
  String id;
  String categoryName;
  bool isSelected;
  String categoryImage;

  CategoryModel({this.categoryName, this.id, this.isSelected});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
