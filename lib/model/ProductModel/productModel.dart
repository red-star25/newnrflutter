import 'package:json_annotation/json_annotation.dart';

part 'productModel.g.dart';

@JsonSerializable()
class ProductModel {
  int id;
  String productImage;
  String productName;
  String productSize;
  double productPrice;
  int productQuantity;
  bool isAdded;
  String productType;
  int minimumOrder;
  String drugType;
  String recommendedFor;
  String storageInstruction;
  String physicalForm;
  String suitableFor;
  List<String> uses;
  List<String> howToUse;
  String paymentTerms;
  int supplyAbility;
  String mainDomesticMarket;
  ProductModel({
    this.id,
    this.productImage,
    this.productName,
    this.productSize,
    this.productPrice,
    this.productQuantity,
    this.isAdded,
    this.productType,
    this.minimumOrder,
    this.drugType,
    this.recommendedFor,
    this.storageInstruction,
    this.physicalForm,
    this.suitableFor,
    this.uses,
    this.howToUse,
    this.paymentTerms,
    this.supplyAbility,
    this.mainDomesticMarket,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
