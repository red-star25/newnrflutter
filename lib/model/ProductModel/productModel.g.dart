// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] as int,
    productImage: json['productImage'] as String,
    productName: json['productName'] as String,
    productSize: json['productSize'] as String,
    productPrice: (json['productPrice'] as num)?.toDouble(),
    productQuantity: json['productQuantity'] as int,
    isAdded: json['isAdded'] as bool,
    productType: json['productType'] as String,
    minimumOrder: json['minimumOrder'] as int,
    drugType: json['drugType'] as String,
    recommendedFor: json['recommendedFor'] as String,
    storageInstruction: json['storageInstruction'] as String,
    physicalForm: json['physicalForm'] as String,
    suitableFor: json['suitableFor'] as String,
    uses: (json['uses'] as List)?.map((e) => e as String)?.toList(),
    howToUse: (json['howToUse'] as List)?.map((e) => e as String)?.toList(),
    paymentTerms: json['paymentTerms'] as String,
    supplyAbility: json['supplyAbility'] as int,
    mainDomesticMarket: json['mainDomesticMarket'] as String,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productImage': instance.productImage,
      'productName': instance.productName,
      'productSize': instance.productSize,
      'productPrice': instance.productPrice,
      'productQuantity': instance.productQuantity,
      'isAdded': instance.isAdded,
      'productType': instance.productType,
      'minimumOrder': instance.minimumOrder,
      'drugType': instance.drugType,
      'recommendedFor': instance.recommendedFor,
      'storageInstruction': instance.storageInstruction,
      'physicalForm': instance.physicalForm,
      'suitableFor': instance.suitableFor,
      'uses': instance.uses,
      'howToUse': instance.howToUse,
      'paymentTerms': instance.paymentTerms,
      'supplyAbility': instance.supplyAbility,
      'mainDomesticMarket': instance.mainDomesticMarket,
    };
