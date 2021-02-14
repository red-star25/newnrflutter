import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class CategoryController extends GetxController {
  final categoryList = RxList<Map>([
    {"name": "Antibiotics", "isSelected": true},
    {"name": "Cough & Cold", "isSelected": false},
    {"name": "Analgesic", "isSelected": false},
    {"name": "Nutritional & Nutraceuticals", "isSelected": false},
    {"name": "Gastrointestinal", "isSelected": false},
    {"name": "Antimenetic", "isSelected": false},
    {"name": "Pesticides", "isSelected": false},
  ].obs);

  final searchedProducts = RxList<ProductModel>().obs;
  final productList = RxList<ProductModel>([
    ProductModel.fromJson({
      "id": 111,
      "productImage": "assets/images/test_product.png",
      "productName": "NRCOF-TR",
      "productSize": "60ml",
      "productPrice": 45.00,
      "productQuantity": 1,
      "isAdded": false,
      "productType": "Syrup",
      "minimumOrder": 30,
      "drugType": "General Medicine",
      "recommendedFor": "Cough",
      "storageInstruction": "Dry Place",
      "physicalForm": "Liquid",
      "suitableFor": "Adults, Women",
      "uses": [
        "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
        "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
      ],
      "howToUse": [
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
      ],
      "paymentTerms": "Cash in Advance (CID), Cash Advance (CA)",
      "supply_ability": 20000,
      "main_domestic_market": "All India"
    }),
    ProductModel.fromJson({
      "id": 222,
      "productImage": "assets/images/test_product.png",
      "productName": "NRMet",
      "productSize": "60ml",
      "productPrice": 45.00,
      "productQuantity": 2,
      "isAdded": false,
      "productType": "Syrup",
      "minimumOrder": 30,
      "drugType": "General Medicine",
      "recommendedFor": "Cough",
      "storageInstruction": "Dry Place",
      "physicalForm": "Liquid",
      "suitableFor": "Adults, Women",
      "uses": [
        "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
        "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
      ],
      "howToUse": [
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
      ],
      "paymentTerms": "Cash in Advance (CID), Cash Advance (CA)",
      "supplyAbility": 20000,
      "mainDomesticMarket": "All India"
    }),
    ProductModel.fromJson({
      "id": 333,
      "productImage": "assets/images/test_product.png",
      "productName": "NRPro",
      "productSize": "60ml",
      "productPrice": 45.00,
      "productQuantity": 2,
      "isAdded": false,
      "productType": "Syrup",
      "minimumOrder": 30,
      "drugType": "General Medicine",
      "recommendedFor": "Cough",
      "storageInstruction": "Dry Place",
      "physicalForm": "Liquid",
      "suitableFor": "Adults, Women",
      "uses": [
        "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
        "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
      ],
      "howToUse": [
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
      ],
      "paymentTerms": "Cash in Advance (CID), Cash Advance (CA)",
      "supplyAbility": 20000,
      "mainDomesticMarket": "All India"
    }),
    ProductModel.fromJson({
      "id": 444,
      "productImage": "assets/images/test_product.png",
      "productName": "NRAnti",
      "productSize": "60ml",
      "productPrice": 45.00,
      "productQuantity": 2,
      "isAdded": false,
      "productType": "Syrup",
      "minimumOrder": 30,
      "drugType": "General Medicine",
      "recommendedFor": "Cough",
      "storageInstruction": "Dry Place",
      "physicalForm": "Liquid",
      "suitableFor": "Adults, Women",
      "uses": [
        "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
        "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
      ],
      "howToUse": [
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
      ],
      "paymentTerms": "Cash in Advance (CID), Cash Advance (CA)",
      "supplyAbility": 20000,
      "mainDomesticMarket": "All India"
    }),
    ProductModel.fromJson({
      "id": 555,
      "productImage": "assets/images/test_product.png",
      "productName": "NRSyrup",
      "productSize": "60ml",
      "productPrice": 45.00,
      "productQuantity": 2,
      "isAdded": false,
      "productType": "Syrup",
      "minimumOrder": 30,
      "drugType": "General Medicine",
      "recommendedFor": "Cough",
      "storageInstruction": "Dry Place",
      "physicalForm": "Liquid",
      "suitableFor": "Adults, Women",
      "uses": [
        "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
        "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
      ],
      "howToUse": [
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
        "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
      ],
      "paymentTerms": "Cash in Advance (CID), Cash Advance (CA)",
      "supplyAbility": 20000,
      "mainDomesticMarket": "All India"
    }),
  ]).obs;

  RxBool isSearchVisible = false.obs;

  void updateIsSearchVisible({bool value}) {
    isSearchVisible = RxBool(value);
    update();
  }

  void addSearchedProducts(String term) {
    searchedProducts.value.clear();
    productList.value.forEach((product) {
      if (product.productName.toLowerCase() == term.toLowerCase()) {
        searchedProducts.value.add(product);
        debugPrint(searchedProducts.toString());
      }
    });
  }

  void setSelectedCategory(int index) {
    for (int i = 0; i < categoryList.length; i++) {
      if (i == index) {
        categoryList[i]["isSelected"] = true;
      } else {
        categoryList[i]["isSelected"] = false;
      }
    }
  }

  void updateProductQuantity({int quantity, int index}) {
    productList.update((product) {
      product[index].productQuantity = quantity;
    });
  }

  void addProductToCartToggle({int id}) {
    productList.update((product) {
      final filteredProduct =
          product.singleWhere((element) => element.id == id);
      if (filteredProduct.isAdded == false) {
        filteredProduct.isAdded = true;
        Get.find<CartController>().cartItems.add(filteredProduct);

        print("Added: ");
        print(Get.find<CartController>().cartItems);
        print("\n");
      } else {
        filteredProduct.isAdded = false;

        Get.find<CartController>()
            .cartItems
            .removeWhere((cartProduct) => cartProduct.id == filteredProduct.id);

        print("Removed");
        print(Get.find<CartController>().cartItems);
        print("\n");
      }
    });
  }

  // getSearchResults(String searchQuery) {
  //   productList.value.forEach((productDetail) {
  //     if (productDetail.values.contains(searchQuery)) searchList.add();
  //   });
  // }
}
