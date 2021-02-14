import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class HomeController extends GetxController {
  ScrollController scrollController;
  RxInt selectedFabIcon = 1.obs;
  final topProducts = RxList<ProductModel>([
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

  final newInProducts = RxList<ProductModel>([
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

  get selectedFabIconIndex => selectedFabIcon;

  updateSelectedFabIcon(int value) {
    selectedFabIcon = RxInt(value);
    // update();
  }

  final cartController = Get.find<CartController>();

  @override
  void onInit() {
    scrollController = ScrollController();

    super.onInit();
  }

  void addProductToCart(ProductModel product, int index) {
    topProducts.update((product) {
      if (product[index].isAdded == false) {
        product[index].isAdded = true;
        cartController.cartItems.add(product[index]);
        // update();

        print("Added: ");
        print(cartController.cartItems);
        print("\n");
      } else {
        product[index].isAdded = false;

        cartController.cartItems
            .removeWhere((cartProduct) => cartProduct.id == product[index].id);
        // update();

        print("Removed");
        print(cartController.cartItems);
        print("\n");
      }
    });
  }

  void addNewInProductToCart(ProductModel product, int index) {
    newInProducts.update((product) {
      if (product[index].isAdded == false) {
        product[index].isAdded = true;
        cartController.cartItems.add(product[index]);
        // update();

        print("Added: ");
        print(cartController.cartItems);
        print("\n");
      } else {
        product[index].isAdded = false;

        cartController.cartItems
            .removeWhere((cartProduct) => cartProduct.id == product[index].id);
        // update();

        print("Removed");
        print(cartController.cartItems);
        print("\n");
      }
    });
  }
}
