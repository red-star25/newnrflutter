// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] as String,
    productImage: json['productImage'] as String,
    productName: json['productName'] as String,
    productSize: json['productSize'] as String,
    productPrice: json['productPrice'] as int,
    isAdded: json['isAdded'] as bool,
    minimumOrder: json['minimumOrder'] as int,
    recommendedFor: json['recommendedFor'] as String,
    physicalForm: json['physicalForm'] as String,
    productDescription: json['productDescription'] as String,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productImage': instance.productImage,
      'productName': instance.productName,
      'productSize': instance.productSize,
      'productPrice': instance.productPrice,
      'isAdded': instance.isAdded,
      'minimumOrder': instance.minimumOrder,
      'recommendedFor': instance.recommendedFor,
      'physicalForm': instance.physicalForm,
      'productDescription': instance.productDescription,
    };
