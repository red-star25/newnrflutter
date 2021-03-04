import 'package:get/get.dart';
import 'package:nrlifecare/model/CategoryModel/categoryModel.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

// ignore: avoid_classes_with_only_static_members
class FakeData {
  static final topProducts = RxList<ProductModel>([
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
  static final newInProducts = RxList<ProductModel>([
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
  static final productList = RxList<ProductModel>([
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
  static final categoryList = RxList<CategoryModel>([
    CategoryModel.fromJson({
      "id": 11,
      "categoryName": "Antibiotics",
      "isSelected": true,
      "categoryImage": "assets/images/test_product.png",
      "products": [
        {
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
        },
      ]
    }),
    CategoryModel.fromJson({
      "id": 11,
      "categoryName": "Analgesic",
      "isSelected": false,
      "categoryImage": "assets/images/test_product.png",
      "products": [
        {
          "id": 222,
          "productImage": "assets/images/test_product.png",
          "productName": "NRMet",
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
        },
        {
          "id": 333,
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
        },
      ]
    }),
    CategoryModel.fromJson({
      "id": 11,
      "categoryName": "Gastro",
      "categoryImage": "assets/images/test_product.png",
      "isSelected": false,
      "products": [
        {
          "id": 444,
          "productImage": "assets/images/test_product.png",
          "productName": "NRPro",
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
        },
        {
          "id": 555,
          "productImage": "assets/images/test_product.png",
          "productName": "NRMet",
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
        },
        {
          "id": 666,
          "productImage": "assets/images/test_product.png",
          "productName": "Syrup",
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
        },
      ]
    }),
    CategoryModel.fromJson({
      "id": 11,
      "categoryName": "Nutra",
      "categoryImage": "assets/images/test_product.png",
      "isSelected": false,
      "products": [
        {
          "id": 777,
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
        },
        {
          "id": 888,
          "productImage": "assets/images/test_product.png",
          "productName": "NRMet",
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
        },
        {
          "id": 999,
          "productImage": "assets/images/test_product.png",
          "productName": "NRPro",
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
        },
        {
          "id": 000,
          "productImage": "assets/images/test_product.png",
          "productName": "NRSyrup",
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
        },
      ]
    }),
    CategoryModel.fromJson({
      "id": 11,
      "categoryName": "Vita",
      "categoryImage": "assets/images/test_product.png",
      "isSelected": false,
      "products": [
        {
          "id": 123,
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
        },
        {
          "id": 456,
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
        },
        {
          "id": 789,
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
        },
        {
          "id": 1011,
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
        },
        {
          "id": 1213,
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
        },
      ]
    }),
    CategoryModel.fromJson({
      "id": 11,
      "categoryName": "Antimenetic",
      "categoryImage": "assets/images/test_product.png",
      "isSelected": false,
      "products": [
        {
          "id": 1415,
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
        },
        {
          "id": 1617,
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
        },
        {
          "id": 1819,
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
        },
        {
          "id": 2021,
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
        },
        {
          "id": 2022,
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
        },
        {
          "id": 2223,
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
        },
      ]
    }),
    CategoryModel.fromJson({
      "categoryImage": "assets/images/test_product.png",
      "id": 11,
      "categoryName": "Pesticides",
      "isSelected": false,
      "products": [
        {
          "id": 2425,
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
        },
        {
          "id": 2526,
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
        },
        {
          "id": 2627,
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
        },
        {
          "id": 2728,
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
        },
        {
          "id": 2930,
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
        },
        {
          "id": 3132,
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
        },
        {
          "id": 3334,
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
        },
      ]
    }),
  ].obs);
}

//   {"name": "Antibiotics", "isSelected": true},
// {"name": "Cough & Cold", "isSelected": false},
// {"name": "Analgesic", "isSelected": false},
// {"name": "Nutritional & Nutraceuticals", "isSelected": false},
// {"name": "Gastrointestinal", "isSelected": false},
// {"name": "Antimenetic", "isSelected": false},
// {"name": "Pesticides", "isSelected": false},
