import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class HomeController extends GetxController {
  ScrollController scrollController;
  int selectedFabIcon = 1;
  List<ProductModel> topProducts;
  CartController cartController;

  get selectedFabIconIndex => selectedFabIcon;

  updateSelectedFabIcon(int value) {
    selectedFabIcon = value;
    update();
  }

  @override
  void onInit() {
    cartController = Get.put(CartController());
    scrollController = ScrollController();
    topProducts = [
      ProductModel.fromJson({
        "id": 111,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRCOF-TR",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 1,
        "is_added": false,
        "product_type": "Syrup",
        "minimum_order": 30,
        "drug_type": "General Medicine",
        "recommended_for": "Cough",
        "storage_instruction": "Dry Place",
        "physical_form": "Liquid",
        "suitable_for": "Adults, Women",
        "uses": [
          "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
          "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
        ],
        "how_to_use": [
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
        ],
        "payment_terms": "Cash in Advance (CID), Cash Advance (CA)",
        "supply_ability": 20000,
        "main_domestic_market": "All India"
      }),
      ProductModel.fromJson({
        "id": 222,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRMet",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 2,
        "is_added": false,
        "product_type": "Syrup",
        "minimum_order": 30,
        "drug_type": "General Medicine",
        "recommended_for": "Cough",
        "storage_instruction": "Dry Place",
        "physical_form": "Liquid",
        "suitable_for": "Adults, Women",
        "uses": [
          "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
          "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
        ],
        "how_to_use": [
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
        ],
        "payment_terms": "Cash in Advance (CID), Cash Advance (CA)",
        "supply_ability": 20000,
        "main_domestic_market": "All India"
      }),
      ProductModel.fromJson({
        "id": 333,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRPro",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 3,
        "is_added": false,
        "product_type": "Syrup",
        "minimum_order": 30,
        "drug_type": "General Medicine",
        "recommended_for": "Cough",
        "storage_instruction": "Dry Place",
        "physical_form": "Liquid",
        "suitable_for": "Adults, Women",
        "uses": [
          "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
          "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
        ],
        "how_to_use": [
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
        ],
        "payment_terms": "Cash in Advance (CID), Cash Advance (CA)",
        "supply_ability": 20000,
        "main_domestic_market": "All India"
      }),
      ProductModel.fromJson({
        "id": 444,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRAnti",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 4,
        "is_added": false,
        "product_type": "Syrup",
        "minimum_order": 30,
        "drug_type": "General Medicine",
        "recommended_for": "Cough",
        "storage_instruction": "Dry Place",
        "physical_form": "Liquid",
        "suitable_for": "Adults, Women",
        "uses": [
          "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
          "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
        ],
        "how_to_use": [
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
        ],
        "payment_terms": "Cash in Advance (CID), Cash Advance (CA)",
        "supply_ability": 20000,
        "main_domestic_market": "All India"
      }),
      ProductModel.fromJson({
        "id": 555,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRSyrup",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 5,
        "is_added": false,
        "product_type": "Syrup",
        "minimum_order": 30,
        "drug_type": "General Medicine",
        "recommended_for": "Cough",
        "storage_instruction": "Dry Place",
        "physical_form": "Liquid",
        "suitable_for": "Adults, Women",
        "uses": [
          "This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
          "This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
        ],
        "how_to_use": [
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
          "Take this medication by mouth, usually every 12 hours or as directed by your doctor."
        ],
        "payment_terms": "Cash in Advance (CID), Cash Advance (CA)",
        "supply_ability": 20000,
        "main_domestic_market": "All India"
      }),
    ];
    super.onInit();
  }

  void addProductToCart(ProductModel product, int index) {
    if (topProducts[index].isAdded == false) {
      topProducts[index].isAdded = true;
      cartController.cartItems.add(topProducts[index]);
      update();

      print("Added: ");
      print(cartController.cartItems);
      print("\n");
    } else {
      topProducts[index].isAdded = false;

      cartController.cartItems
          .removeWhere((product) => product.id == topProducts[index].id);
      update();

      print("Removed");
      print(cartController.cartItems);
      print("\n");
    }
  }
}
