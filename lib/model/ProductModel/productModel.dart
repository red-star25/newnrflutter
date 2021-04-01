import 'package:json_annotation/json_annotation.dart';

part 'productModel.g.dart';

@JsonSerializable()
class ProductModel {
  String id;
  String productImage;
  String productName;
  String productSize;
  int productPrice;
  bool isAdded;
  int minimumOrder;
  String recommendedFor;
  String physicalForm;
  String productDescription;
  ProductModel(
      {this.id,
      this.productImage,
      this.productName,
      this.productSize,
      this.productPrice,
      this.isAdded,
      this.minimumOrder,
      this.recommendedFor,
      this.physicalForm,
      this.productDescription});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
